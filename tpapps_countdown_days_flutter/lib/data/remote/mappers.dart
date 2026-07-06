import '../../domain/enums.dart';
import '../../domain/models/countdown.dart';
import '../../domain/models/reminder.dart';
import 'dto/countdown_dto.dart';

/// Domain → wire.
CountdownDto countdownToDto(Countdown c) => CountdownDto(
  id: c.id,
  title: c.title,
  note: c.note,
  targetMs: c.target.millisecondsSinceEpoch,
  allDay: c.allDay,
  calendarType: c.calendarType,
  lunarLeapMonth: c.lunarLeapMonth,
  direction: c.direction,
  precision: c.precision,
  repeatRule: c.repeatRule,
  repeatInterval: c.repeatInterval,
  colorValue: c.colorValue,
  icon: c.icon,
  pinned: c.pinned,
  sortOrder: c.sortOrder,
  reminders: [
    for (final r in c.reminders)
      ReminderDto(
        id: r.id,
        enabled: r.enabled,
        offsetDays: r.offsetDays,
        offsetHours: r.offsetHours,
        offsetMinutes: r.offsetMinutes,
        soundId: r.soundId,
      ),
  ],
  createdAtMs: c.createdAt.millisecondsSinceEpoch,
  updatedAtMs: c.updatedAt.millisecondsSinceEpoch,
  deleted: c.deleted,
);

/// Wire → domain. Marks the record as [SyncState.synced]; reminder `notifId`s
/// (a local concern absent from the wire) are derived deterministically from
/// the reminder id so rescheduling stays stable across pulls.
Countdown countdownFromDto(CountdownDto d) {
  final created = DateTime.fromMillisecondsSinceEpoch(d.createdAtMs);
  final updated = DateTime.fromMillisecondsSinceEpoch(d.updatedAtMs);
  return Countdown(
    id: d.id,
    title: d.title,
    note: d.note,
    target: DateTime.fromMillisecondsSinceEpoch(d.targetMs),
    allDay: d.allDay,
    calendarType: d.calendarType,
    lunarLeapMonth: d.lunarLeapMonth,
    direction: d.direction,
    precision: d.precision,
    repeatRule: d.repeatRule,
    repeatInterval: d.repeatInterval,
    colorValue: d.colorValue,
    icon: d.icon,
    pinned: d.pinned,
    sortOrder: d.sortOrder,
    reminders: [
      for (final r in d.reminders)
        Reminder(
          id: r.id,
          countdownId: d.id,
          enabled: r.enabled,
          offsetDays: r.offsetDays,
          offsetHours: r.offsetHours,
          offsetMinutes: r.offsetMinutes,
          soundId: r.soundId,
          notifId: r.id.hashCode & 0x7FFFFFFF,
          createdAt: created,
          updatedAt: updated,
        ),
    ],
    createdAt: created,
    updatedAt: updated,
    remoteId: d.id,
    syncState: SyncState.synced,
    deleted: d.deleted,
  );
}
