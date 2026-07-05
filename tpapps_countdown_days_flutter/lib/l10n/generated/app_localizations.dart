import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Countdown'**
  String get appTitle;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @actionAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get actionAdd;

  /// No description provided for @actionOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get actionOk;

  /// No description provided for @actionShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get actionShare;

  /// No description provided for @actionSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get actionSearch;

  /// No description provided for @tabAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get tabAll;

  /// No description provided for @sectionPinned.
  ///
  /// In en, this message translates to:
  /// **'Pinned'**
  String get sectionPinned;

  /// No description provided for @sectionUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get sectionUpcoming;

  /// No description provided for @sectionPast.
  ///
  /// In en, this message translates to:
  /// **'Past'**
  String get sectionPast;

  /// No description provided for @sectionUncategorized.
  ///
  /// In en, this message translates to:
  /// **'Uncategorized'**
  String get sectionUncategorized;

  /// No description provided for @listEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No countdowns yet'**
  String get listEmptyTitle;

  /// No description provided for @listEmptySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first important day'**
  String get listEmptySubtitle;

  /// No description provided for @newCountdown.
  ///
  /// In en, this message translates to:
  /// **'New Countdown'**
  String get newCountdown;

  /// No description provided for @editCountdown.
  ///
  /// In en, this message translates to:
  /// **'Edit Countdown'**
  String get editCountdown;

  /// No description provided for @sortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get sortBy;

  /// No description provided for @sortDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get sortDate;

  /// No description provided for @sortCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get sortCreated;

  /// No description provided for @sortName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sortName;

  /// No description provided for @sortManual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get sortManual;

  /// No description provided for @targetDate.
  ///
  /// In en, this message translates to:
  /// **'Target date'**
  String get targetDate;

  /// No description provided for @lunarDate.
  ///
  /// In en, this message translates to:
  /// **'Lunar date'**
  String get lunarDate;

  /// No description provided for @repeats.
  ///
  /// In en, this message translates to:
  /// **'Repeats'**
  String get repeats;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @noReminders.
  ///
  /// In en, this message translates to:
  /// **'No reminders'**
  String get noReminders;

  /// No description provided for @shareAsImage.
  ///
  /// In en, this message translates to:
  /// **'Share as image'**
  String get shareAsImage;

  /// No description provided for @isToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get isToday;

  /// No description provided for @daysLeft.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{{count} day left} other{{count} days left}}'**
  String daysLeft(int count);

  /// No description provided for @daysSince.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{{count} day since} other{{count} days since}}'**
  String daysSince(int count);

  /// No description provided for @unitDay.
  ///
  /// In en, this message translates to:
  /// **'d'**
  String get unitDay;

  /// No description provided for @unitHour.
  ///
  /// In en, this message translates to:
  /// **'h'**
  String get unitHour;

  /// No description provided for @unitMinute.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get unitMinute;

  /// No description provided for @unitSecond.
  ///
  /// In en, this message translates to:
  /// **'s'**
  String get unitSecond;

  /// No description provided for @unitMillisecond.
  ///
  /// In en, this message translates to:
  /// **'ms'**
  String get unitMillisecond;

  /// No description provided for @fieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get fieldTitle;

  /// No description provided for @fieldTitleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Mom\'s birthday'**
  String get fieldTitleHint;

  /// No description provided for @fieldNote.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get fieldNote;

  /// No description provided for @fieldNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Optional note'**
  String get fieldNoteHint;

  /// No description provided for @fieldDateTime.
  ///
  /// In en, this message translates to:
  /// **'Date & time'**
  String get fieldDateTime;

  /// No description provided for @fieldAllDay.
  ///
  /// In en, this message translates to:
  /// **'All day'**
  String get fieldAllDay;

  /// No description provided for @fieldCalendarType.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get fieldCalendarType;

  /// No description provided for @calendarSolar.
  ///
  /// In en, this message translates to:
  /// **'Solar'**
  String get calendarSolar;

  /// No description provided for @calendarLunar.
  ///
  /// In en, this message translates to:
  /// **'Lunar'**
  String get calendarLunar;

  /// No description provided for @fieldLeapMonth.
  ///
  /// In en, this message translates to:
  /// **'Leap month'**
  String get fieldLeapMonth;

  /// No description provided for @fieldPrecision.
  ///
  /// In en, this message translates to:
  /// **'Precision'**
  String get fieldPrecision;

  /// No description provided for @precisionDay.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get precisionDay;

  /// No description provided for @precisionHour.
  ///
  /// In en, this message translates to:
  /// **'Hour'**
  String get precisionHour;

  /// No description provided for @precisionMinute.
  ///
  /// In en, this message translates to:
  /// **'Minute'**
  String get precisionMinute;

  /// No description provided for @precisionSecond.
  ///
  /// In en, this message translates to:
  /// **'Second'**
  String get precisionSecond;

  /// No description provided for @precisionMillisecond.
  ///
  /// In en, this message translates to:
  /// **'Millisecond'**
  String get precisionMillisecond;

  /// No description provided for @fieldDirection.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get fieldDirection;

  /// No description provided for @directionCountdown.
  ///
  /// In en, this message translates to:
  /// **'Countdown'**
  String get directionCountdown;

  /// No description provided for @directionCountup.
  ///
  /// In en, this message translates to:
  /// **'Count up'**
  String get directionCountup;

  /// No description provided for @fieldRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get fieldRepeat;

  /// No description provided for @repeatNone.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get repeatNone;

  /// No description provided for @repeatWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get repeatWeekly;

  /// No description provided for @repeatMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get repeatMonthly;

  /// No description provided for @repeatYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get repeatYearly;

  /// No description provided for @repeatLunarYearly.
  ///
  /// In en, this message translates to:
  /// **'Lunar yearly'**
  String get repeatLunarYearly;

  /// No description provided for @fieldCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get fieldCategory;

  /// No description provided for @fieldColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get fieldColor;

  /// No description provided for @fieldIcon.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get fieldIcon;

  /// No description provided for @fieldCover.
  ///
  /// In en, this message translates to:
  /// **'Cover photo'**
  String get fieldCover;

  /// No description provided for @remindBefore.
  ///
  /// In en, this message translates to:
  /// **'Remind before'**
  String get remindBefore;

  /// No description provided for @remindDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{} =1{1 day} other{{count} days}}'**
  String remindDays(int count);

  /// No description provided for @remindHours.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{} =1{1 hour} other{{count} hours}}'**
  String remindHours(int count);

  /// No description provided for @remindMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{} =1{1 minute} other{{count} minutes}}'**
  String remindMinutes(int count);

  /// No description provided for @remindAtEventTime.
  ///
  /// In en, this message translates to:
  /// **'At time of event'**
  String get remindAtEventTime;

  /// No description provided for @reminderSound.
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get reminderSound;

  /// No description provided for @addReminder.
  ///
  /// In en, this message translates to:
  /// **'Add reminder'**
  String get addReminder;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settingsGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsGeneral;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsData.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get settingsData;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get languageSystem;

  /// No description provided for @languageChinese.
  ///
  /// In en, this message translates to:
  /// **'中文'**
  String get languageChinese;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @defaultPrecision.
  ///
  /// In en, this message translates to:
  /// **'Default precision'**
  String get defaultPrecision;

  /// No description provided for @firstDayOfWeek.
  ///
  /// In en, this message translates to:
  /// **'First day of week'**
  String get firstDayOfWeek;

  /// No description provided for @weekdaySunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get weekdaySunday;

  /// No description provided for @weekdayMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get weekdayMonday;

  /// No description provided for @showLunar.
  ///
  /// In en, this message translates to:
  /// **'Show lunar date'**
  String get showLunar;

  /// No description provided for @notificationSound.
  ///
  /// In en, this message translates to:
  /// **'Notification sound'**
  String get notificationSound;

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export backup'**
  String get exportData;

  /// No description provided for @importData.
  ///
  /// In en, this message translates to:
  /// **'Import backup'**
  String get importData;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @deleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete countdown?'**
  String get deleteConfirmTitle;

  /// No description provided for @deleteConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get deleteConfirmMessage;

  /// No description provided for @exportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup exported'**
  String get exportSuccess;

  /// No description provided for @importSuccess.
  ///
  /// In en, this message translates to:
  /// **'Backup imported'**
  String get importSuccess;

  /// No description provided for @importFailed.
  ///
  /// In en, this message translates to:
  /// **'Import failed'**
  String get importFailed;

  /// No description provided for @notificationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Notification permission denied'**
  String get notificationPermissionDenied;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
