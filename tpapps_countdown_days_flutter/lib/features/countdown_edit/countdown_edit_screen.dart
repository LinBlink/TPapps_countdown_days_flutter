import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../app/theme.dart';
import '../../domain/models/countdown.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers/repositories.dart';
import '../../providers/settings_providers.dart';

const _uuid = Uuid();

/// Create (when [countdownId] is null) or edit an existing countdown.
///
/// Phase 1 covers the core fields; note / lunar calendar / precision /
/// direction / repeat / category / cover / reminders are layered on in later
/// milestones. The widget loads any existing record in [initState].
class CountdownEditScreen extends ConsumerStatefulWidget {
  const CountdownEditScreen({super.key, this.countdownId});

  final String? countdownId;

  @override
  ConsumerState<CountdownEditScreen> createState() =>
      _CountdownEditScreenState();
}

class _CountdownEditScreenState extends ConsumerState<CountdownEditScreen> {
  final _titleController = TextEditingController();
  DateTime _target = DateTime.now().add(const Duration(days: 1));
  bool _allDay = true;
  int _colorValue = AppPalette.eventColors.first;
  String _icon = AppPalette.eventEmojis.first;

  Countdown? _existing;
  bool _loading = true;

  bool get _isEditing => widget.countdownId != null;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (!_isEditing) {
      setState(() => _loading = false);
      return;
    }
    final c =
        await ref.read(countdownRepositoryProvider).getById(widget.countdownId!);
    if (!mounted) return;
    if (c != null) {
      _existing = c;
      _titleController.text = c.title;
      _target = c.target;
      _allDay = c.allDay;
      _colorValue = c.colorValue;
      _icon = c.icon;
    }
    setState(() => _loading = false);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;
    final now = DateTime.now();
    final base = _existing ??
        Countdown(
          id: _uuid.v4(),
          title: title,
          target: _target,
          precision: ref.read(settingsProvider).defaultPrecision,
          createdAt: now,
          updatedAt: now,
        );
    final updated = base.copyWith(
      title: title,
      target: _target,
      allDay: _allDay,
      colorValue: _colorValue,
      icon: _icon,
      updatedAt: now,
    );
    await ref.read(countdownRepositoryProvider).upsert(updated);
    if (mounted) context.pop();
  }

  Future<void> _pickDate() async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (modalContext) => Container(
        height: 300,
        color: CupertinoColors.systemBackground.resolveFrom(modalContext),
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: CupertinoDatePicker(
                mode: _allDay
                    ? CupertinoDatePickerMode.date
                    : CupertinoDatePickerMode.dateAndTime,
                initialDateTime: _target,
                onDateTimeChanged: (d) => setState(() => _target = d),
              ),
            ),
            CupertinoButton(
              onPressed: () => Navigator.pop(modalContext),
              child: Text(AppLocalizations.of(modalContext).actionDone),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    if (_loading) {
      return const CupertinoPageScaffold(
        child: Center(child: CupertinoActivityIndicator()),
      );
    }
    final localeName = Localizations.localeOf(context).toString();
    final dateStr = _allDay
        ? DateFormat.yMMMEd(localeName).format(_target)
        : DateFormat.yMMMEd(localeName).add_jm().format(_target);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(_isEditing ? l.editCountdown : l.newCountdown),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _save,
          child: Text(l.actionSave),
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            CupertinoListSection.insetGrouped(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: CupertinoTextField(
                    controller: _titleController,
                    placeholder: l.fieldTitleHint,
                    decoration: const BoxDecoration(),
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: Text(l.fieldAllDay),
                  trailing: CupertinoSwitch(
                    value: _allDay,
                    onChanged: (v) => setState(() => _allDay = v),
                  ),
                ),
                CupertinoListTile(
                  title: Text(l.fieldDateTime),
                  additionalInfo: Text(dateStr),
                  trailing: const CupertinoListTileChevron(),
                  onTap: _pickDate,
                ),
              ],
            ),
            _IconPicker(
              selected: _icon,
              onSelected: (e) => setState(() => _icon = e),
            ),
            _ColorPicker(
              selected: _colorValue,
              onSelected: (c) => setState(() => _colorValue = c),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconPicker extends StatelessWidget {
  const _IconPicker({required this.selected, required this.onSelected});

  final String selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: Text(AppLocalizations.of(context).fieldIcon),
      children: [
        SizedBox(
          height: 52,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              for (final e in AppPalette.eventEmojis)
                GestureDetector(
                  onTap: () => onSelected(e),
                  child: Container(
                    width: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: e == selected
                          ? CupertinoColors.systemBlue.withValues(alpha: 0.2)
                          : CupertinoColors.tertiarySystemFill
                              .resolveFrom(context),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(e, style: const TextStyle(fontSize: 20)),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({required this.selected, required this.onSelected});

  final int selected;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: Text(AppLocalizations.of(context).fieldColor),
      children: [
        SizedBox(
          height: 52,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              for (final c in AppPalette.eventColors)
                GestureDetector(
                  onTap: () => onSelected(c),
                  child: Container(
                    width: 34,
                    height: 34,
                    margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
                    decoration: BoxDecoration(
                      color: Color(c),
                      shape: BoxShape.circle,
                      border: c == selected
                          ? Border.all(
                              color: CupertinoColors.label.resolveFrom(context),
                              width: 3,
                            )
                          : null,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
