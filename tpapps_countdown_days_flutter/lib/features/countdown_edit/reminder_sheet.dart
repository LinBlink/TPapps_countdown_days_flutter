import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../../core/sounds.dart';
import '../../domain/models/reminder.dart';
import '../../l10n/generated/app_localizations.dart';

const _uuid = Uuid();
final _random = Random();

/// Bottom sheet to add or edit a reminder: how long before the event to fire
/// (days / hours / minutes) and which sound to play. Returns the [Reminder] via
/// `Navigator.pop`.
class ReminderSheet extends StatefulWidget {
  const ReminderSheet({
    super.key,
    required this.countdownId,
    required this.defaultSoundId,
    this.initial,
  });

  final String countdownId;
  final String defaultSoundId;
  final Reminder? initial;

  @override
  State<ReminderSheet> createState() => _ReminderSheetState();
}

class _ReminderSheetState extends State<ReminderSheet> {
  late int _days = widget.initial?.offsetDays ?? 1;
  late int _hours = widget.initial?.offsetHours ?? 0;
  late int _minutes = widget.initial?.offsetMinutes ?? 0;
  late String _sound = widget.initial?.soundId ?? widget.defaultSoundId;

  void _save() {
    final now = DateTime.now();
    Navigator.pop(
      context,
      Reminder(
        id: widget.initial?.id ?? _uuid.v4(),
        countdownId: widget.countdownId,
        enabled: widget.initial?.enabled ?? true,
        offsetDays: _days,
        offsetHours: _hours,
        offsetMinutes: _minutes,
        soundId: _sound,
        notifId: widget.initial?.notifId ?? _random.nextInt(0x7FFFFFFF),
        createdAt: widget.initial?.createdAt ?? now,
        updatedAt: now,
      ),
    );
  }

  Future<void> _pickSound(AppLocalizations l) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: Text(l.reminderSound),
        actions: [
          for (final id in kNotificationSounds)
            CupertinoActionSheetAction(
              onPressed: () {
                setState(() => _sound = id);
                Navigator.pop(sheetContext);
              },
              child: Text(soundLabel(id, l.soundDefault)),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(sheetContext),
          child: Text(l.actionCancel),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Container(
      height: 380,
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(l.actionCancel),
                  ),
                  Text(
                    l.remindBefore,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  CupertinoButton(onPressed: _save, child: Text(l.actionDone)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  _Wheel(
                    label: l.unitDay,
                    count: 61,
                    value: _days,
                    onChanged: (v) => _days = v,
                  ),
                  _Wheel(
                    label: l.unitHour,
                    count: 24,
                    value: _hours,
                    onChanged: (v) => _hours = v,
                  ),
                  _Wheel(
                    label: l.unitMinute,
                    count: 60,
                    value: _minutes,
                    onChanged: (v) => _minutes = v,
                  ),
                ],
              ),
            ),
            CupertinoListTile(
              title: Text(l.reminderSound),
              additionalInfo: Text(soundLabel(_sound, l.soundDefault)),
              trailing: const CupertinoListTileChevron(),
              onTap: () => _pickSound(l),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _Wheel extends StatelessWidget {
  const _Wheel({
    required this.label,
    required this.count,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final int count;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: CupertinoColors.secondaryLabel.resolveFrom(context),
              ),
            ),
          ),
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: value),
              itemExtent: 34,
              onSelectedItemChanged: onChanged,
              children: [
                for (var i = 0; i < count; i++) Center(child: Text('$i')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
