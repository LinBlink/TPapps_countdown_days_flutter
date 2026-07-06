import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../app/theme.dart';
import '../../core/lunar/lunar_service.dart';
import '../../domain/enums.dart';
import '../../domain/models/countdown.dart';
import '../../domain/models/reminder.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers/repositories.dart';
import '../../providers/services.dart';
import '../../providers/settings_providers.dart';
import 'reminder_sheet.dart';

const _uuid = Uuid();

/// Create (when [countdownId] is null) or edit an existing countdown.
class CountdownEditScreen extends ConsumerStatefulWidget {
  const CountdownEditScreen({super.key, this.countdownId});

  final String? countdownId;

  @override
  ConsumerState<CountdownEditScreen> createState() =>
      _CountdownEditScreenState();
}

class _CountdownEditScreenState extends ConsumerState<CountdownEditScreen> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();

  late final String _id = widget.countdownId ?? _uuid.v4();
  DateTime _target = DateTime.now().add(const Duration(days: 1));
  bool _allDay = true;
  CalendarType _calendarType = CalendarType.solar;
  Direction _direction = Direction.countdown;
  Precision _precision = Precision.day;
  RepeatRule _repeat = RepeatRule.none;
  int _colorValue = AppPalette.eventColors.first;
  String _icon = AppPalette.eventEmojis.first;
  final List<Reminder> _reminders = [];

  Countdown? _existing;
  bool _loading = true;

  bool get _isEditing => widget.countdownId != null;

  @override
  void initState() {
    super.initState();
    _precision = ref.read(settingsProvider).defaultPrecision;
    _load();
  }

  Future<void> _load() async {
    if (!_isEditing) {
      setState(() => _loading = false);
      return;
    }
    final c = await ref
        .read(countdownRepositoryProvider)
        .getById(widget.countdownId!);
    if (!mounted) return;
    if (c != null) {
      _existing = c;
      _titleController.text = c.title;
      _noteController.text = c.note ?? '';
      _target = c.target;
      _allDay = c.allDay;
      _calendarType = c.calendarType;
      _direction = c.direction;
      _precision = c.precision;
      _repeat = c.repeatRule;
      _colorValue = c.colorValue;
      _icon = c.icon;
      _reminders
        ..clear()
        ..addAll(c.reminders);
    }
    setState(() => _loading = false);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;
    final now = DateTime.now();
    final leap =
        _calendarType == CalendarType.lunar && lunarInfoOf(_target).isLeapMonth;

    final countdown = Countdown(
      id: _id,
      title: title,
      note: _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim(),
      target: _target,
      allDay: _allDay,
      calendarType: _calendarType,
      lunarLeapMonth: leap,
      direction: _direction,
      precision: _precision,
      repeatRule: _repeat,
      colorValue: _colorValue,
      icon: _icon,
      pinned: _existing?.pinned ?? false,
      sortOrder: _existing?.sortOrder ?? 0,
      categoryId: _existing?.categoryId,
      reminders: _reminders,
      createdAt: _existing?.createdAt ?? now,
      updatedAt: now,
      remoteId: _existing?.remoteId,
    );

    await ref.read(countdownRepositoryProvider).upsert(countdown);
    final notifications = ref.read(notificationServiceProvider);
    if (_reminders.any((r) => r.enabled)) {
      await notifications.requestPermissions();
    }
    await notifications.scheduleForCountdown(countdown);
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
              height: 240,
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

  Future<void> _pickPrecision(AppLocalizations l) => _pickFromSheet<Precision>(
    title: l.fieldPrecision,
    values: Precision.values,
    label: (p) => _precisionLabel(l, p),
    onSelected: (p) => setState(() => _precision = p),
  );

  Future<void> _pickRepeat(AppLocalizations l) => _pickFromSheet<RepeatRule>(
    title: l.fieldRepeat,
    values: RepeatRule.values,
    label: (r) => _repeatLabel(l, r),
    onSelected: (r) => setState(() => _repeat = r),
  );

  Future<void> _pickFromSheet<T>({
    required String title,
    required List<T> values,
    required String Function(T) label,
    required ValueChanged<T> onSelected,
  }) async {
    final l = AppLocalizations.of(context);
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: Text(title),
        actions: [
          for (final v in values)
            CupertinoActionSheetAction(
              onPressed: () {
                onSelected(v);
                Navigator.pop(sheetContext);
              },
              child: Text(label(v)),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(sheetContext),
          child: Text(l.actionCancel),
        ),
      ),
    );
  }

  Future<void> _addOrEditReminder({Reminder? existing}) async {
    final result = await showCupertinoModalPopup<Reminder>(
      context: context,
      builder: (_) => ReminderSheet(
        countdownId: _id,
        defaultSoundId: ref.read(settingsProvider).defaultSoundId,
        initial: existing,
      ),
    );
    if (result == null) return;
    setState(() {
      if (existing != null) {
        final i = _reminders.indexWhere((r) => r.id == existing.id);
        if (i >= 0) _reminders[i] = result;
      } else {
        _reminders.add(result);
      }
    });
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
    final lunarHint = _calendarType == CalendarType.lunar
        ? lunarInfoOf(_target).monthDay
        : null;

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
                _textField(_titleController, l.fieldTitleHint),
                _textField(_noteController, l.fieldNoteHint),
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
                CupertinoListTile(
                  title: Text(l.fieldCalendarType),
                  trailing: CupertinoSlidingSegmentedControl<CalendarType>(
                    groupValue: _calendarType,
                    onValueChanged: (v) =>
                        setState(() => _calendarType = v ?? CalendarType.solar),
                    children: {
                      CalendarType.solar: Text(l.calendarSolar),
                      CalendarType.lunar: Text(l.calendarLunar),
                    },
                  ),
                ),
                if (lunarHint != null)
                  CupertinoListTile(
                    title: Text(l.lunarDate),
                    additionalInfo: Text(lunarHint),
                  ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              children: [
                CupertinoListTile(
                  title: Text(l.fieldDirection),
                  trailing: CupertinoSlidingSegmentedControl<Direction>(
                    groupValue: _direction,
                    onValueChanged: (v) =>
                        setState(() => _direction = v ?? Direction.countdown),
                    children: {
                      Direction.countdown: Text(l.directionCountdown),
                      Direction.countup: Text(l.directionCountup),
                    },
                  ),
                ),
                CupertinoListTile(
                  title: Text(l.fieldPrecision),
                  additionalInfo: Text(_precisionLabel(l, _precision)),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _pickPrecision(l),
                ),
                CupertinoListTile(
                  title: Text(l.fieldRepeat),
                  additionalInfo: Text(_repeatLabel(l, _repeat)),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _pickRepeat(l),
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
            CupertinoListSection.insetGrouped(
              header: Text(l.reminders),
              children: [
                for (final r in _reminders)
                  CupertinoListTile(
                    title: Text(_offsetSummary(l, r)),
                    additionalInfo: Text(
                      r.soundId == 'default' ? l.soundDefault : r.soundId,
                    ),
                    trailing: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => setState(() => _reminders.remove(r)),
                      child: const Icon(
                        CupertinoIcons.minus_circle_fill,
                        color: CupertinoColors.destructiveRed,
                      ),
                    ),
                    onTap: () => _addOrEditReminder(existing: r),
                  ),
                CupertinoListTile(
                  title: Text(l.addReminder),
                  leading: const Icon(CupertinoIcons.add_circled),
                  onTap: () => _addOrEditReminder(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField(TextEditingController controller, String placeholder) =>
      Padding(
        padding: const EdgeInsets.all(12),
        child: CupertinoTextField(
          controller: controller,
          placeholder: placeholder,
          decoration: const BoxDecoration(),
        ),
      );

  String _offsetSummary(AppLocalizations l, Reminder r) {
    if (r.offset == Duration.zero) return l.remindAtEventTime;
    final parts = <String>[
      if (r.offsetDays > 0) l.remindDays(r.offsetDays),
      if (r.offsetHours > 0) l.remindHours(r.offsetHours),
      if (r.offsetMinutes > 0) l.remindMinutes(r.offsetMinutes),
    ];
    return '${l.remindBefore}: ${parts.join(' ')}';
  }
}

String _precisionLabel(AppLocalizations l, Precision p) => switch (p) {
  Precision.day => l.precisionDay,
  Precision.hour => l.precisionHour,
  Precision.minute => l.precisionMinute,
  Precision.second => l.precisionSecond,
  Precision.millisecond => l.precisionMillisecond,
};

String _repeatLabel(AppLocalizations l, RepeatRule r) => switch (r) {
  RepeatRule.none => l.repeatNone,
  RepeatRule.weekly => l.repeatWeekly,
  RepeatRule.monthly => l.repeatMonthly,
  RepeatRule.yearly => l.repeatYearly,
  RepeatRule.lunarYearly => l.repeatLunarYearly,
};

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
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 6,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: e == selected
                          ? CupertinoColors.systemBlue.withValues(alpha: 0.2)
                          : CupertinoColors.tertiarySystemFill.resolveFrom(
                              context,
                            ),
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
                    margin: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 9,
                    ),
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
