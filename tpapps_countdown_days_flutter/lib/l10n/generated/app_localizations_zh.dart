// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '倒数日';

  @override
  String get actionSave => '保存';

  @override
  String get actionCancel => '取消';

  @override
  String get actionDelete => '删除';

  @override
  String get actionEdit => '编辑';

  @override
  String get actionDone => '完成';

  @override
  String get actionAdd => '添加';

  @override
  String get actionOk => '好';

  @override
  String get actionShare => '分享';

  @override
  String get actionSearch => '搜索';

  @override
  String get tabAll => '全部';

  @override
  String get sectionPinned => '置顶';

  @override
  String get sectionUpcoming => '即将到来';

  @override
  String get sectionPast => '已过去';

  @override
  String get sectionUncategorized => '未分类';

  @override
  String get listEmptyTitle => '还没有倒数日';

  @override
  String get listEmptySubtitle => '点击 + 添加你的第一个重要日子';

  @override
  String get newCountdown => '新建倒数日';

  @override
  String get editCountdown => '编辑倒数日';

  @override
  String get sortBy => '排序方式';

  @override
  String get sortDate => '日期';

  @override
  String get sortCreated => '创建时间';

  @override
  String get sortName => '名称';

  @override
  String get sortManual => '手动';

  @override
  String get targetDate => '目标日期';

  @override
  String get lunarDate => '农历';

  @override
  String get repeats => '重复';

  @override
  String get reminders => '提醒';

  @override
  String get noReminders => '无提醒';

  @override
  String get shareAsImage => '分享为图片';

  @override
  String get isToday => '就是今天';

  @override
  String daysLeft(int count) {
    return '还有 $count 天';
  }

  @override
  String daysSince(int count) {
    return '已经 $count 天';
  }

  @override
  String get unitDay => '天';

  @override
  String get unitHour => '时';

  @override
  String get unitMinute => '分';

  @override
  String get unitSecond => '秒';

  @override
  String get unitMillisecond => '毫秒';

  @override
  String get fieldTitle => '标题';

  @override
  String get fieldTitleHint => '例如：妈妈的生日';

  @override
  String get fieldNote => '备注';

  @override
  String get fieldNoteHint => '可选备注';

  @override
  String get fieldDateTime => '日期与时间';

  @override
  String get fieldAllDay => '全天';

  @override
  String get fieldCalendarType => '历法';

  @override
  String get calendarSolar => '公历';

  @override
  String get calendarLunar => '农历';

  @override
  String get fieldLeapMonth => '闰月';

  @override
  String get fieldPrecision => '精度';

  @override
  String get precisionDay => '天';

  @override
  String get precisionHour => '时';

  @override
  String get precisionMinute => '分';

  @override
  String get precisionSecond => '秒';

  @override
  String get precisionMillisecond => '毫秒';

  @override
  String get fieldDirection => '类型';

  @override
  String get directionCountdown => '倒数';

  @override
  String get directionCountup => '正数';

  @override
  String get fieldRepeat => '重复';

  @override
  String get repeatNone => '不重复';

  @override
  String get repeatWeekly => '每周';

  @override
  String get repeatMonthly => '每月';

  @override
  String get repeatYearly => '每年';

  @override
  String get repeatLunarYearly => '每年（农历）';

  @override
  String get fieldCategory => '分类';

  @override
  String get fieldColor => '颜色';

  @override
  String get fieldIcon => '图标';

  @override
  String get fieldCover => '封面图片';

  @override
  String get remindBefore => '提前提醒';

  @override
  String remindDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 天',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String remindHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 小时',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String remindMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 分钟',
      zero: '',
    );
    return '$_temp0';
  }

  @override
  String get remindAtEventTime => '事件发生时';

  @override
  String get reminderSound => '铃声';

  @override
  String get addReminder => '添加提醒';

  @override
  String get settings => '设置';

  @override
  String get settingsGeneral => '通用';

  @override
  String get settingsAppearance => '外观';

  @override
  String get settingsData => '数据';

  @override
  String get settingsAbout => '关于';

  @override
  String get language => '语言';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get languageChinese => '中文';

  @override
  String get languageEnglish => 'English';

  @override
  String get theme => '主题';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get defaultPrecision => '默认精度';

  @override
  String get firstDayOfWeek => '每周起始日';

  @override
  String get weekdaySunday => '周日';

  @override
  String get weekdayMonday => '周一';

  @override
  String get showLunar => '显示农历';

  @override
  String get notificationSound => '通知铃声';

  @override
  String get exportData => '导出备份';

  @override
  String get importData => '导入备份';

  @override
  String get version => '版本';

  @override
  String get deleteConfirmTitle => '删除倒数日？';

  @override
  String get deleteConfirmMessage => '此操作无法撤销。';

  @override
  String get exportSuccess => '备份已导出';

  @override
  String get importSuccess => '备份已导入';

  @override
  String get importFailed => '导入失败';

  @override
  String get notificationPermissionDenied => '通知权限被拒绝';
}
