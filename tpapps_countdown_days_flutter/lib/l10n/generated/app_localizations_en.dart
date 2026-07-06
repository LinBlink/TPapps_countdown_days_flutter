// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Countdown';

  @override
  String get actionSave => 'Save';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionDone => 'Done';

  @override
  String get actionAdd => 'Add';

  @override
  String get actionOk => 'OK';

  @override
  String get actionShare => 'Share';

  @override
  String get actionSearch => 'Search';

  @override
  String get tabAll => 'All';

  @override
  String get sectionPinned => 'Pinned';

  @override
  String get sectionUpcoming => 'Upcoming';

  @override
  String get sectionPast => 'Past';

  @override
  String get sectionUncategorized => 'Uncategorized';

  @override
  String get listEmptyTitle => 'No countdowns yet';

  @override
  String get listEmptySubtitle => 'Tap + to add your first important day';

  @override
  String get newCountdown => 'New Countdown';

  @override
  String get editCountdown => 'Edit Countdown';

  @override
  String get sortBy => 'Sort by';

  @override
  String get sortDate => 'Date';

  @override
  String get sortCreated => 'Created';

  @override
  String get sortName => 'Name';

  @override
  String get sortManual => 'Manual';

  @override
  String get targetDate => 'Target date';

  @override
  String get lunarDate => 'Lunar date';

  @override
  String get repeats => 'Repeats';

  @override
  String get reminders => 'Reminders';

  @override
  String get noReminders => 'No reminders';

  @override
  String get shareAsImage => 'Share as image';

  @override
  String get isToday => 'Today';

  @override
  String daysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days left',
      one: '$count day left',
    );
    return '$_temp0';
  }

  @override
  String daysSince(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days since',
      one: '$count day since',
    );
    return '$_temp0';
  }

  @override
  String get unitDay => 'd';

  @override
  String get unitHour => 'h';

  @override
  String get unitMinute => 'm';

  @override
  String get unitSecond => 's';

  @override
  String get unitMillisecond => 'ms';

  @override
  String get fieldTitle => 'Title';

  @override
  String get fieldTitleHint => 'e.g. Mom\'s birthday';

  @override
  String get fieldNote => 'Note';

  @override
  String get fieldNoteHint => 'Optional note';

  @override
  String get fieldDateTime => 'Date & time';

  @override
  String get fieldAllDay => 'All day';

  @override
  String get fieldCalendarType => 'Calendar';

  @override
  String get calendarSolar => 'Solar';

  @override
  String get calendarLunar => 'Lunar';

  @override
  String get fieldLeapMonth => 'Leap month';

  @override
  String get fieldPrecision => 'Precision';

  @override
  String get precisionDay => 'Day';

  @override
  String get precisionHour => 'Hour';

  @override
  String get precisionMinute => 'Minute';

  @override
  String get precisionSecond => 'Second';

  @override
  String get precisionMillisecond => 'Millisecond';

  @override
  String get fieldDirection => 'Type';

  @override
  String get directionCountdown => 'Countdown';

  @override
  String get directionCountup => 'Count up';

  @override
  String get fieldRepeat => 'Repeat';

  @override
  String get repeatNone => 'Never';

  @override
  String get repeatWeekly => 'Weekly';

  @override
  String get repeatMonthly => 'Monthly';

  @override
  String get repeatYearly => 'Yearly';

  @override
  String get repeatLunarYearly => 'Lunar yearly';

  @override
  String get fieldCategory => 'Category';

  @override
  String get fieldColor => 'Color';

  @override
  String get fieldIcon => 'Icon';

  @override
  String get fieldCover => 'Cover photo';

  @override
  String get remindBefore => 'Remind before';

  @override
  String remindDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String remindHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours',
      one: '1 hour',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String remindMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes',
      one: '1 minute',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String get remindAtEventTime => 'At time of event';

  @override
  String get reminderSound => 'Sound';

  @override
  String get soundDefault => 'Default';

  @override
  String get addReminder => 'Add reminder';

  @override
  String get enableReminders => 'Reminders';

  @override
  String get settings => 'Settings';

  @override
  String get settingsGeneral => 'General';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsAbout => 'About';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'Follow system';

  @override
  String get languageChinese => '中文';

  @override
  String get languageEnglish => 'English';

  @override
  String get theme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get defaultPrecision => 'Default precision';

  @override
  String get firstDayOfWeek => 'First day of week';

  @override
  String get weekdaySunday => 'Sunday';

  @override
  String get weekdayMonday => 'Monday';

  @override
  String get showLunar => 'Show lunar date';

  @override
  String get notificationSound => 'Notification sound';

  @override
  String get exportData => 'Export backup';

  @override
  String get importData => 'Import backup';

  @override
  String get version => 'Version';

  @override
  String get deleteConfirmTitle => 'Delete countdown?';

  @override
  String get deleteConfirmMessage => 'This action cannot be undone.';

  @override
  String get exportSuccess => 'Backup exported';

  @override
  String get importSuccess => 'Backup imported';

  @override
  String get importFailed => 'Import failed';

  @override
  String get notificationPermissionDenied => 'Notification permission denied';
}
