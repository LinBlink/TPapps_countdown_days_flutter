// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CountdownsTable extends Countdowns
    with TableInfo<$CountdownsTable, CountdownRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountdownsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetMsMeta = const VerificationMeta(
    'targetMs',
  );
  @override
  late final GeneratedColumn<int> targetMs = GeneratedColumn<int>(
    'target_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tzNameMeta = const VerificationMeta('tzName');
  @override
  late final GeneratedColumn<String> tzName = GeneratedColumn<String>(
    'tz_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('local'),
  );
  static const VerificationMeta _allDayMeta = const VerificationMeta('allDay');
  @override
  late final GeneratedColumn<bool> allDay = GeneratedColumn<bool>(
    'all_day',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("all_day" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  late final GeneratedColumnWithTypeConverter<CalendarType, int> calendarType =
      GeneratedColumn<int>(
        'calendar_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<CalendarType>($CountdownsTable.$convertercalendarType);
  static const VerificationMeta _lunarLeapMonthMeta = const VerificationMeta(
    'lunarLeapMonth',
  );
  @override
  late final GeneratedColumn<bool> lunarLeapMonth = GeneratedColumn<bool>(
    'lunar_leap_month',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("lunar_leap_month" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Direction, int> direction =
      GeneratedColumn<int>(
        'direction',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Direction>($CountdownsTable.$converterdirection);
  @override
  late final GeneratedColumnWithTypeConverter<Precision, int> precision =
      GeneratedColumn<int>(
        'precision',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<Precision>($CountdownsTable.$converterprecision);
  @override
  late final GeneratedColumnWithTypeConverter<RepeatRule, int> repeatRule =
      GeneratedColumn<int>(
        'repeat_rule',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<RepeatRule>($CountdownsTable.$converterrepeatRule);
  static const VerificationMeta _repeatIntervalMeta = const VerificationMeta(
    'repeatInterval',
  );
  @override
  late final GeneratedColumn<int> repeatInterval = GeneratedColumn<int>(
    'repeat_interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0xFF0A84FF),
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('📅'),
  );
  static const VerificationMeta _coverPathMeta = const VerificationMeta(
    'coverPath',
  );
  @override
  late final GeneratedColumn<String> coverPath = GeneratedColumn<String>(
    'cover_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pinnedMeta = const VerificationMeta('pinned');
  @override
  late final GeneratedColumn<bool> pinned = GeneratedColumn<bool>(
    'pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pinned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMsMeta = const VerificationMeta(
    'createdAtMs',
  );
  @override
  late final GeneratedColumn<int> createdAtMs = GeneratedColumn<int>(
    'created_at_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMsMeta = const VerificationMeta(
    'updatedAtMs',
  );
  @override
  late final GeneratedColumn<int> updatedAtMs = GeneratedColumn<int>(
    'updated_at_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncState, int> syncState =
      GeneratedColumn<int>(
        'sync_state',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: Constant(SyncState.localOnly.index),
      ).withConverter<SyncState>($CountdownsTable.$convertersyncState);
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    note,
    targetMs,
    tzName,
    allDay,
    calendarType,
    lunarLeapMonth,
    direction,
    precision,
    repeatRule,
    repeatInterval,
    categoryId,
    colorValue,
    icon,
    coverPath,
    pinned,
    sortOrder,
    createdAtMs,
    updatedAtMs,
    remoteId,
    syncState,
    deleted,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'countdowns';
  @override
  VerificationContext validateIntegrity(
    Insertable<CountdownRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('target_ms')) {
      context.handle(
        _targetMsMeta,
        targetMs.isAcceptableOrUnknown(data['target_ms']!, _targetMsMeta),
      );
    } else if (isInserting) {
      context.missing(_targetMsMeta);
    }
    if (data.containsKey('tz_name')) {
      context.handle(
        _tzNameMeta,
        tzName.isAcceptableOrUnknown(data['tz_name']!, _tzNameMeta),
      );
    }
    if (data.containsKey('all_day')) {
      context.handle(
        _allDayMeta,
        allDay.isAcceptableOrUnknown(data['all_day']!, _allDayMeta),
      );
    }
    if (data.containsKey('lunar_leap_month')) {
      context.handle(
        _lunarLeapMonthMeta,
        lunarLeapMonth.isAcceptableOrUnknown(
          data['lunar_leap_month']!,
          _lunarLeapMonthMeta,
        ),
      );
    }
    if (data.containsKey('repeat_interval')) {
      context.handle(
        _repeatIntervalMeta,
        repeatInterval.isAcceptableOrUnknown(
          data['repeat_interval']!,
          _repeatIntervalMeta,
        ),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('cover_path')) {
      context.handle(
        _coverPathMeta,
        coverPath.isAcceptableOrUnknown(data['cover_path']!, _coverPathMeta),
      );
    }
    if (data.containsKey('pinned')) {
      context.handle(
        _pinnedMeta,
        pinned.isAcceptableOrUnknown(data['pinned']!, _pinnedMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at_ms')) {
      context.handle(
        _createdAtMsMeta,
        createdAtMs.isAcceptableOrUnknown(
          data['created_at_ms']!,
          _createdAtMsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtMsMeta);
    }
    if (data.containsKey('updated_at_ms')) {
      context.handle(
        _updatedAtMsMeta,
        updatedAtMs.isAcceptableOrUnknown(
          data['updated_at_ms']!,
          _updatedAtMsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMsMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CountdownRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountdownRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      targetMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_ms'],
      )!,
      tzName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tz_name'],
      )!,
      allDay: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}all_day'],
      )!,
      calendarType: $CountdownsTable.$convertercalendarType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}calendar_type'],
        )!,
      ),
      lunarLeapMonth: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}lunar_leap_month'],
      )!,
      direction: $CountdownsTable.$converterdirection.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}direction'],
        )!,
      ),
      precision: $CountdownsTable.$converterprecision.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}precision'],
        )!,
      ),
      repeatRule: $CountdownsTable.$converterrepeatRule.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}repeat_rule'],
        )!,
      ),
      repeatInterval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repeat_interval'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      ),
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      coverPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_path'],
      ),
      pinned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pinned'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAtMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at_ms'],
      )!,
      updatedAtMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at_ms'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      syncState: $CountdownsTable.$convertersyncState.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}sync_state'],
        )!,
      ),
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
      )!,
    );
  }

  @override
  $CountdownsTable createAlias(String alias) {
    return $CountdownsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CalendarType, int, int> $convertercalendarType =
      const EnumIndexConverter<CalendarType>(CalendarType.values);
  static JsonTypeConverter2<Direction, int, int> $converterdirection =
      const EnumIndexConverter<Direction>(Direction.values);
  static JsonTypeConverter2<Precision, int, int> $converterprecision =
      const EnumIndexConverter<Precision>(Precision.values);
  static JsonTypeConverter2<RepeatRule, int, int> $converterrepeatRule =
      const EnumIndexConverter<RepeatRule>(RepeatRule.values);
  static JsonTypeConverter2<SyncState, int, int> $convertersyncState =
      const EnumIndexConverter<SyncState>(SyncState.values);
}

class CountdownRow extends DataClass implements Insertable<CountdownRow> {
  final String id;
  final String title;
  final String? note;
  final int targetMs;
  final String tzName;
  final bool allDay;
  final CalendarType calendarType;
  final bool lunarLeapMonth;
  final Direction direction;
  final Precision precision;
  final RepeatRule repeatRule;
  final int repeatInterval;
  final String? categoryId;
  final int colorValue;
  final String icon;
  final String? coverPath;
  final bool pinned;
  final int sortOrder;
  final int createdAtMs;
  final int updatedAtMs;
  final String? remoteId;
  final SyncState syncState;
  final bool deleted;
  const CountdownRow({
    required this.id,
    required this.title,
    this.note,
    required this.targetMs,
    required this.tzName,
    required this.allDay,
    required this.calendarType,
    required this.lunarLeapMonth,
    required this.direction,
    required this.precision,
    required this.repeatRule,
    required this.repeatInterval,
    this.categoryId,
    required this.colorValue,
    required this.icon,
    this.coverPath,
    required this.pinned,
    required this.sortOrder,
    required this.createdAtMs,
    required this.updatedAtMs,
    this.remoteId,
    required this.syncState,
    required this.deleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['target_ms'] = Variable<int>(targetMs);
    map['tz_name'] = Variable<String>(tzName);
    map['all_day'] = Variable<bool>(allDay);
    {
      map['calendar_type'] = Variable<int>(
        $CountdownsTable.$convertercalendarType.toSql(calendarType),
      );
    }
    map['lunar_leap_month'] = Variable<bool>(lunarLeapMonth);
    {
      map['direction'] = Variable<int>(
        $CountdownsTable.$converterdirection.toSql(direction),
      );
    }
    {
      map['precision'] = Variable<int>(
        $CountdownsTable.$converterprecision.toSql(precision),
      );
    }
    {
      map['repeat_rule'] = Variable<int>(
        $CountdownsTable.$converterrepeatRule.toSql(repeatRule),
      );
    }
    map['repeat_interval'] = Variable<int>(repeatInterval);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['color_value'] = Variable<int>(colorValue);
    map['icon'] = Variable<String>(icon);
    if (!nullToAbsent || coverPath != null) {
      map['cover_path'] = Variable<String>(coverPath);
    }
    map['pinned'] = Variable<bool>(pinned);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at_ms'] = Variable<int>(createdAtMs);
    map['updated_at_ms'] = Variable<int>(updatedAtMs);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    {
      map['sync_state'] = Variable<int>(
        $CountdownsTable.$convertersyncState.toSql(syncState),
      );
    }
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  CountdownsCompanion toCompanion(bool nullToAbsent) {
    return CountdownsCompanion(
      id: Value(id),
      title: Value(title),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      targetMs: Value(targetMs),
      tzName: Value(tzName),
      allDay: Value(allDay),
      calendarType: Value(calendarType),
      lunarLeapMonth: Value(lunarLeapMonth),
      direction: Value(direction),
      precision: Value(precision),
      repeatRule: Value(repeatRule),
      repeatInterval: Value(repeatInterval),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      colorValue: Value(colorValue),
      icon: Value(icon),
      coverPath: coverPath == null && nullToAbsent
          ? const Value.absent()
          : Value(coverPath),
      pinned: Value(pinned),
      sortOrder: Value(sortOrder),
      createdAtMs: Value(createdAtMs),
      updatedAtMs: Value(updatedAtMs),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      syncState: Value(syncState),
      deleted: Value(deleted),
    );
  }

  factory CountdownRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CountdownRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      note: serializer.fromJson<String?>(json['note']),
      targetMs: serializer.fromJson<int>(json['targetMs']),
      tzName: serializer.fromJson<String>(json['tzName']),
      allDay: serializer.fromJson<bool>(json['allDay']),
      calendarType: $CountdownsTable.$convertercalendarType.fromJson(
        serializer.fromJson<int>(json['calendarType']),
      ),
      lunarLeapMonth: serializer.fromJson<bool>(json['lunarLeapMonth']),
      direction: $CountdownsTable.$converterdirection.fromJson(
        serializer.fromJson<int>(json['direction']),
      ),
      precision: $CountdownsTable.$converterprecision.fromJson(
        serializer.fromJson<int>(json['precision']),
      ),
      repeatRule: $CountdownsTable.$converterrepeatRule.fromJson(
        serializer.fromJson<int>(json['repeatRule']),
      ),
      repeatInterval: serializer.fromJson<int>(json['repeatInterval']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      colorValue: serializer.fromJson<int>(json['colorValue']),
      icon: serializer.fromJson<String>(json['icon']),
      coverPath: serializer.fromJson<String?>(json['coverPath']),
      pinned: serializer.fromJson<bool>(json['pinned']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAtMs: serializer.fromJson<int>(json['createdAtMs']),
      updatedAtMs: serializer.fromJson<int>(json['updatedAtMs']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      syncState: $CountdownsTable.$convertersyncState.fromJson(
        serializer.fromJson<int>(json['syncState']),
      ),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'note': serializer.toJson<String?>(note),
      'targetMs': serializer.toJson<int>(targetMs),
      'tzName': serializer.toJson<String>(tzName),
      'allDay': serializer.toJson<bool>(allDay),
      'calendarType': serializer.toJson<int>(
        $CountdownsTable.$convertercalendarType.toJson(calendarType),
      ),
      'lunarLeapMonth': serializer.toJson<bool>(lunarLeapMonth),
      'direction': serializer.toJson<int>(
        $CountdownsTable.$converterdirection.toJson(direction),
      ),
      'precision': serializer.toJson<int>(
        $CountdownsTable.$converterprecision.toJson(precision),
      ),
      'repeatRule': serializer.toJson<int>(
        $CountdownsTable.$converterrepeatRule.toJson(repeatRule),
      ),
      'repeatInterval': serializer.toJson<int>(repeatInterval),
      'categoryId': serializer.toJson<String?>(categoryId),
      'colorValue': serializer.toJson<int>(colorValue),
      'icon': serializer.toJson<String>(icon),
      'coverPath': serializer.toJson<String?>(coverPath),
      'pinned': serializer.toJson<bool>(pinned),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAtMs': serializer.toJson<int>(createdAtMs),
      'updatedAtMs': serializer.toJson<int>(updatedAtMs),
      'remoteId': serializer.toJson<String?>(remoteId),
      'syncState': serializer.toJson<int>(
        $CountdownsTable.$convertersyncState.toJson(syncState),
      ),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  CountdownRow copyWith({
    String? id,
    String? title,
    Value<String?> note = const Value.absent(),
    int? targetMs,
    String? tzName,
    bool? allDay,
    CalendarType? calendarType,
    bool? lunarLeapMonth,
    Direction? direction,
    Precision? precision,
    RepeatRule? repeatRule,
    int? repeatInterval,
    Value<String?> categoryId = const Value.absent(),
    int? colorValue,
    String? icon,
    Value<String?> coverPath = const Value.absent(),
    bool? pinned,
    int? sortOrder,
    int? createdAtMs,
    int? updatedAtMs,
    Value<String?> remoteId = const Value.absent(),
    SyncState? syncState,
    bool? deleted,
  }) => CountdownRow(
    id: id ?? this.id,
    title: title ?? this.title,
    note: note.present ? note.value : this.note,
    targetMs: targetMs ?? this.targetMs,
    tzName: tzName ?? this.tzName,
    allDay: allDay ?? this.allDay,
    calendarType: calendarType ?? this.calendarType,
    lunarLeapMonth: lunarLeapMonth ?? this.lunarLeapMonth,
    direction: direction ?? this.direction,
    precision: precision ?? this.precision,
    repeatRule: repeatRule ?? this.repeatRule,
    repeatInterval: repeatInterval ?? this.repeatInterval,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
    colorValue: colorValue ?? this.colorValue,
    icon: icon ?? this.icon,
    coverPath: coverPath.present ? coverPath.value : this.coverPath,
    pinned: pinned ?? this.pinned,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAtMs: createdAtMs ?? this.createdAtMs,
    updatedAtMs: updatedAtMs ?? this.updatedAtMs,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    syncState: syncState ?? this.syncState,
    deleted: deleted ?? this.deleted,
  );
  CountdownRow copyWithCompanion(CountdownsCompanion data) {
    return CountdownRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      note: data.note.present ? data.note.value : this.note,
      targetMs: data.targetMs.present ? data.targetMs.value : this.targetMs,
      tzName: data.tzName.present ? data.tzName.value : this.tzName,
      allDay: data.allDay.present ? data.allDay.value : this.allDay,
      calendarType: data.calendarType.present
          ? data.calendarType.value
          : this.calendarType,
      lunarLeapMonth: data.lunarLeapMonth.present
          ? data.lunarLeapMonth.value
          : this.lunarLeapMonth,
      direction: data.direction.present ? data.direction.value : this.direction,
      precision: data.precision.present ? data.precision.value : this.precision,
      repeatRule: data.repeatRule.present
          ? data.repeatRule.value
          : this.repeatRule,
      repeatInterval: data.repeatInterval.present
          ? data.repeatInterval.value
          : this.repeatInterval,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      icon: data.icon.present ? data.icon.value : this.icon,
      coverPath: data.coverPath.present ? data.coverPath.value : this.coverPath,
      pinned: data.pinned.present ? data.pinned.value : this.pinned,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAtMs: data.createdAtMs.present
          ? data.createdAtMs.value
          : this.createdAtMs,
      updatedAtMs: data.updatedAtMs.present
          ? data.updatedAtMs.value
          : this.updatedAtMs,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CountdownRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('targetMs: $targetMs, ')
          ..write('tzName: $tzName, ')
          ..write('allDay: $allDay, ')
          ..write('calendarType: $calendarType, ')
          ..write('lunarLeapMonth: $lunarLeapMonth, ')
          ..write('direction: $direction, ')
          ..write('precision: $precision, ')
          ..write('repeatRule: $repeatRule, ')
          ..write('repeatInterval: $repeatInterval, ')
          ..write('categoryId: $categoryId, ')
          ..write('colorValue: $colorValue, ')
          ..write('icon: $icon, ')
          ..write('coverPath: $coverPath, ')
          ..write('pinned: $pinned, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAtMs: $createdAtMs, ')
          ..write('updatedAtMs: $updatedAtMs, ')
          ..write('remoteId: $remoteId, ')
          ..write('syncState: $syncState, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    title,
    note,
    targetMs,
    tzName,
    allDay,
    calendarType,
    lunarLeapMonth,
    direction,
    precision,
    repeatRule,
    repeatInterval,
    categoryId,
    colorValue,
    icon,
    coverPath,
    pinned,
    sortOrder,
    createdAtMs,
    updatedAtMs,
    remoteId,
    syncState,
    deleted,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CountdownRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.note == this.note &&
          other.targetMs == this.targetMs &&
          other.tzName == this.tzName &&
          other.allDay == this.allDay &&
          other.calendarType == this.calendarType &&
          other.lunarLeapMonth == this.lunarLeapMonth &&
          other.direction == this.direction &&
          other.precision == this.precision &&
          other.repeatRule == this.repeatRule &&
          other.repeatInterval == this.repeatInterval &&
          other.categoryId == this.categoryId &&
          other.colorValue == this.colorValue &&
          other.icon == this.icon &&
          other.coverPath == this.coverPath &&
          other.pinned == this.pinned &&
          other.sortOrder == this.sortOrder &&
          other.createdAtMs == this.createdAtMs &&
          other.updatedAtMs == this.updatedAtMs &&
          other.remoteId == this.remoteId &&
          other.syncState == this.syncState &&
          other.deleted == this.deleted);
}

class CountdownsCompanion extends UpdateCompanion<CountdownRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> note;
  final Value<int> targetMs;
  final Value<String> tzName;
  final Value<bool> allDay;
  final Value<CalendarType> calendarType;
  final Value<bool> lunarLeapMonth;
  final Value<Direction> direction;
  final Value<Precision> precision;
  final Value<RepeatRule> repeatRule;
  final Value<int> repeatInterval;
  final Value<String?> categoryId;
  final Value<int> colorValue;
  final Value<String> icon;
  final Value<String?> coverPath;
  final Value<bool> pinned;
  final Value<int> sortOrder;
  final Value<int> createdAtMs;
  final Value<int> updatedAtMs;
  final Value<String?> remoteId;
  final Value<SyncState> syncState;
  final Value<bool> deleted;
  final Value<int> rowid;
  const CountdownsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.note = const Value.absent(),
    this.targetMs = const Value.absent(),
    this.tzName = const Value.absent(),
    this.allDay = const Value.absent(),
    this.calendarType = const Value.absent(),
    this.lunarLeapMonth = const Value.absent(),
    this.direction = const Value.absent(),
    this.precision = const Value.absent(),
    this.repeatRule = const Value.absent(),
    this.repeatInterval = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.icon = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.pinned = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAtMs = const Value.absent(),
    this.updatedAtMs = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.syncState = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CountdownsCompanion.insert({
    required String id,
    required String title,
    this.note = const Value.absent(),
    required int targetMs,
    this.tzName = const Value.absent(),
    this.allDay = const Value.absent(),
    required CalendarType calendarType,
    this.lunarLeapMonth = const Value.absent(),
    required Direction direction,
    required Precision precision,
    required RepeatRule repeatRule,
    this.repeatInterval = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.icon = const Value.absent(),
    this.coverPath = const Value.absent(),
    this.pinned = const Value.absent(),
    this.sortOrder = const Value.absent(),
    required int createdAtMs,
    required int updatedAtMs,
    this.remoteId = const Value.absent(),
    this.syncState = const Value.absent(),
    this.deleted = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       targetMs = Value(targetMs),
       calendarType = Value(calendarType),
       direction = Value(direction),
       precision = Value(precision),
       repeatRule = Value(repeatRule),
       createdAtMs = Value(createdAtMs),
       updatedAtMs = Value(updatedAtMs);
  static Insertable<CountdownRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? note,
    Expression<int>? targetMs,
    Expression<String>? tzName,
    Expression<bool>? allDay,
    Expression<int>? calendarType,
    Expression<bool>? lunarLeapMonth,
    Expression<int>? direction,
    Expression<int>? precision,
    Expression<int>? repeatRule,
    Expression<int>? repeatInterval,
    Expression<String>? categoryId,
    Expression<int>? colorValue,
    Expression<String>? icon,
    Expression<String>? coverPath,
    Expression<bool>? pinned,
    Expression<int>? sortOrder,
    Expression<int>? createdAtMs,
    Expression<int>? updatedAtMs,
    Expression<String>? remoteId,
    Expression<int>? syncState,
    Expression<bool>? deleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (note != null) 'note': note,
      if (targetMs != null) 'target_ms': targetMs,
      if (tzName != null) 'tz_name': tzName,
      if (allDay != null) 'all_day': allDay,
      if (calendarType != null) 'calendar_type': calendarType,
      if (lunarLeapMonth != null) 'lunar_leap_month': lunarLeapMonth,
      if (direction != null) 'direction': direction,
      if (precision != null) 'precision': precision,
      if (repeatRule != null) 'repeat_rule': repeatRule,
      if (repeatInterval != null) 'repeat_interval': repeatInterval,
      if (categoryId != null) 'category_id': categoryId,
      if (colorValue != null) 'color_value': colorValue,
      if (icon != null) 'icon': icon,
      if (coverPath != null) 'cover_path': coverPath,
      if (pinned != null) 'pinned': pinned,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAtMs != null) 'created_at_ms': createdAtMs,
      if (updatedAtMs != null) 'updated_at_ms': updatedAtMs,
      if (remoteId != null) 'remote_id': remoteId,
      if (syncState != null) 'sync_state': syncState,
      if (deleted != null) 'deleted': deleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CountdownsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? note,
    Value<int>? targetMs,
    Value<String>? tzName,
    Value<bool>? allDay,
    Value<CalendarType>? calendarType,
    Value<bool>? lunarLeapMonth,
    Value<Direction>? direction,
    Value<Precision>? precision,
    Value<RepeatRule>? repeatRule,
    Value<int>? repeatInterval,
    Value<String?>? categoryId,
    Value<int>? colorValue,
    Value<String>? icon,
    Value<String?>? coverPath,
    Value<bool>? pinned,
    Value<int>? sortOrder,
    Value<int>? createdAtMs,
    Value<int>? updatedAtMs,
    Value<String?>? remoteId,
    Value<SyncState>? syncState,
    Value<bool>? deleted,
    Value<int>? rowid,
  }) {
    return CountdownsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      targetMs: targetMs ?? this.targetMs,
      tzName: tzName ?? this.tzName,
      allDay: allDay ?? this.allDay,
      calendarType: calendarType ?? this.calendarType,
      lunarLeapMonth: lunarLeapMonth ?? this.lunarLeapMonth,
      direction: direction ?? this.direction,
      precision: precision ?? this.precision,
      repeatRule: repeatRule ?? this.repeatRule,
      repeatInterval: repeatInterval ?? this.repeatInterval,
      categoryId: categoryId ?? this.categoryId,
      colorValue: colorValue ?? this.colorValue,
      icon: icon ?? this.icon,
      coverPath: coverPath ?? this.coverPath,
      pinned: pinned ?? this.pinned,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAtMs: createdAtMs ?? this.createdAtMs,
      updatedAtMs: updatedAtMs ?? this.updatedAtMs,
      remoteId: remoteId ?? this.remoteId,
      syncState: syncState ?? this.syncState,
      deleted: deleted ?? this.deleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (targetMs.present) {
      map['target_ms'] = Variable<int>(targetMs.value);
    }
    if (tzName.present) {
      map['tz_name'] = Variable<String>(tzName.value);
    }
    if (allDay.present) {
      map['all_day'] = Variable<bool>(allDay.value);
    }
    if (calendarType.present) {
      map['calendar_type'] = Variable<int>(
        $CountdownsTable.$convertercalendarType.toSql(calendarType.value),
      );
    }
    if (lunarLeapMonth.present) {
      map['lunar_leap_month'] = Variable<bool>(lunarLeapMonth.value);
    }
    if (direction.present) {
      map['direction'] = Variable<int>(
        $CountdownsTable.$converterdirection.toSql(direction.value),
      );
    }
    if (precision.present) {
      map['precision'] = Variable<int>(
        $CountdownsTable.$converterprecision.toSql(precision.value),
      );
    }
    if (repeatRule.present) {
      map['repeat_rule'] = Variable<int>(
        $CountdownsTable.$converterrepeatRule.toSql(repeatRule.value),
      );
    }
    if (repeatInterval.present) {
      map['repeat_interval'] = Variable<int>(repeatInterval.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (coverPath.present) {
      map['cover_path'] = Variable<String>(coverPath.value);
    }
    if (pinned.present) {
      map['pinned'] = Variable<bool>(pinned.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAtMs.present) {
      map['created_at_ms'] = Variable<int>(createdAtMs.value);
    }
    if (updatedAtMs.present) {
      map['updated_at_ms'] = Variable<int>(updatedAtMs.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(
        $CountdownsTable.$convertersyncState.toSql(syncState.value),
      );
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountdownsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('note: $note, ')
          ..write('targetMs: $targetMs, ')
          ..write('tzName: $tzName, ')
          ..write('allDay: $allDay, ')
          ..write('calendarType: $calendarType, ')
          ..write('lunarLeapMonth: $lunarLeapMonth, ')
          ..write('direction: $direction, ')
          ..write('precision: $precision, ')
          ..write('repeatRule: $repeatRule, ')
          ..write('repeatInterval: $repeatInterval, ')
          ..write('categoryId: $categoryId, ')
          ..write('colorValue: $colorValue, ')
          ..write('icon: $icon, ')
          ..write('coverPath: $coverPath, ')
          ..write('pinned: $pinned, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAtMs: $createdAtMs, ')
          ..write('updatedAtMs: $updatedAtMs, ')
          ..write('remoteId: $remoteId, ')
          ..write('syncState: $syncState, ')
          ..write('deleted: $deleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, ReminderRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countdownIdMeta = const VerificationMeta(
    'countdownId',
  );
  @override
  late final GeneratedColumn<String> countdownId = GeneratedColumn<String>(
    'countdown_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES countdowns (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _offsetDaysMeta = const VerificationMeta(
    'offsetDays',
  );
  @override
  late final GeneratedColumn<int> offsetDays = GeneratedColumn<int>(
    'offset_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _offsetHoursMeta = const VerificationMeta(
    'offsetHours',
  );
  @override
  late final GeneratedColumn<int> offsetHours = GeneratedColumn<int>(
    'offset_hours',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _offsetMinutesMeta = const VerificationMeta(
    'offsetMinutes',
  );
  @override
  late final GeneratedColumn<int> offsetMinutes = GeneratedColumn<int>(
    'offset_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _soundIdMeta = const VerificationMeta(
    'soundId',
  );
  @override
  late final GeneratedColumn<String> soundId = GeneratedColumn<String>(
    'sound_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('default'),
  );
  static const VerificationMeta _notifIdMeta = const VerificationMeta(
    'notifId',
  );
  @override
  late final GeneratedColumn<int> notifId = GeneratedColumn<int>(
    'notif_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMsMeta = const VerificationMeta(
    'createdAtMs',
  );
  @override
  late final GeneratedColumn<int> createdAtMs = GeneratedColumn<int>(
    'created_at_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMsMeta = const VerificationMeta(
    'updatedAtMs',
  );
  @override
  late final GeneratedColumn<int> updatedAtMs = GeneratedColumn<int>(
    'updated_at_ms',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    countdownId,
    enabled,
    offsetDays,
    offsetHours,
    offsetMinutes,
    soundId,
    notifId,
    createdAtMs,
    updatedAtMs,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('countdown_id')) {
      context.handle(
        _countdownIdMeta,
        countdownId.isAcceptableOrUnknown(
          data['countdown_id']!,
          _countdownIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_countdownIdMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('offset_days')) {
      context.handle(
        _offsetDaysMeta,
        offsetDays.isAcceptableOrUnknown(data['offset_days']!, _offsetDaysMeta),
      );
    }
    if (data.containsKey('offset_hours')) {
      context.handle(
        _offsetHoursMeta,
        offsetHours.isAcceptableOrUnknown(
          data['offset_hours']!,
          _offsetHoursMeta,
        ),
      );
    }
    if (data.containsKey('offset_minutes')) {
      context.handle(
        _offsetMinutesMeta,
        offsetMinutes.isAcceptableOrUnknown(
          data['offset_minutes']!,
          _offsetMinutesMeta,
        ),
      );
    }
    if (data.containsKey('sound_id')) {
      context.handle(
        _soundIdMeta,
        soundId.isAcceptableOrUnknown(data['sound_id']!, _soundIdMeta),
      );
    }
    if (data.containsKey('notif_id')) {
      context.handle(
        _notifIdMeta,
        notifId.isAcceptableOrUnknown(data['notif_id']!, _notifIdMeta),
      );
    } else if (isInserting) {
      context.missing(_notifIdMeta);
    }
    if (data.containsKey('created_at_ms')) {
      context.handle(
        _createdAtMsMeta,
        createdAtMs.isAcceptableOrUnknown(
          data['created_at_ms']!,
          _createdAtMsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdAtMsMeta);
    }
    if (data.containsKey('updated_at_ms')) {
      context.handle(
        _updatedAtMsMeta,
        updatedAtMs.isAcceptableOrUnknown(
          data['updated_at_ms']!,
          _updatedAtMsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      countdownId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}countdown_id'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      offsetDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}offset_days'],
      )!,
      offsetHours: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}offset_hours'],
      )!,
      offsetMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}offset_minutes'],
      )!,
      soundId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sound_id'],
      )!,
      notifId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notif_id'],
      )!,
      createdAtMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at_ms'],
      )!,
      updatedAtMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at_ms'],
      )!,
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class ReminderRow extends DataClass implements Insertable<ReminderRow> {
  final String id;
  final String countdownId;
  final bool enabled;
  final int offsetDays;
  final int offsetHours;
  final int offsetMinutes;
  final String soundId;
  final int notifId;
  final int createdAtMs;
  final int updatedAtMs;
  const ReminderRow({
    required this.id,
    required this.countdownId,
    required this.enabled,
    required this.offsetDays,
    required this.offsetHours,
    required this.offsetMinutes,
    required this.soundId,
    required this.notifId,
    required this.createdAtMs,
    required this.updatedAtMs,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['countdown_id'] = Variable<String>(countdownId);
    map['enabled'] = Variable<bool>(enabled);
    map['offset_days'] = Variable<int>(offsetDays);
    map['offset_hours'] = Variable<int>(offsetHours);
    map['offset_minutes'] = Variable<int>(offsetMinutes);
    map['sound_id'] = Variable<String>(soundId);
    map['notif_id'] = Variable<int>(notifId);
    map['created_at_ms'] = Variable<int>(createdAtMs);
    map['updated_at_ms'] = Variable<int>(updatedAtMs);
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      countdownId: Value(countdownId),
      enabled: Value(enabled),
      offsetDays: Value(offsetDays),
      offsetHours: Value(offsetHours),
      offsetMinutes: Value(offsetMinutes),
      soundId: Value(soundId),
      notifId: Value(notifId),
      createdAtMs: Value(createdAtMs),
      updatedAtMs: Value(updatedAtMs),
    );
  }

  factory ReminderRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderRow(
      id: serializer.fromJson<String>(json['id']),
      countdownId: serializer.fromJson<String>(json['countdownId']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      offsetDays: serializer.fromJson<int>(json['offsetDays']),
      offsetHours: serializer.fromJson<int>(json['offsetHours']),
      offsetMinutes: serializer.fromJson<int>(json['offsetMinutes']),
      soundId: serializer.fromJson<String>(json['soundId']),
      notifId: serializer.fromJson<int>(json['notifId']),
      createdAtMs: serializer.fromJson<int>(json['createdAtMs']),
      updatedAtMs: serializer.fromJson<int>(json['updatedAtMs']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'countdownId': serializer.toJson<String>(countdownId),
      'enabled': serializer.toJson<bool>(enabled),
      'offsetDays': serializer.toJson<int>(offsetDays),
      'offsetHours': serializer.toJson<int>(offsetHours),
      'offsetMinutes': serializer.toJson<int>(offsetMinutes),
      'soundId': serializer.toJson<String>(soundId),
      'notifId': serializer.toJson<int>(notifId),
      'createdAtMs': serializer.toJson<int>(createdAtMs),
      'updatedAtMs': serializer.toJson<int>(updatedAtMs),
    };
  }

  ReminderRow copyWith({
    String? id,
    String? countdownId,
    bool? enabled,
    int? offsetDays,
    int? offsetHours,
    int? offsetMinutes,
    String? soundId,
    int? notifId,
    int? createdAtMs,
    int? updatedAtMs,
  }) => ReminderRow(
    id: id ?? this.id,
    countdownId: countdownId ?? this.countdownId,
    enabled: enabled ?? this.enabled,
    offsetDays: offsetDays ?? this.offsetDays,
    offsetHours: offsetHours ?? this.offsetHours,
    offsetMinutes: offsetMinutes ?? this.offsetMinutes,
    soundId: soundId ?? this.soundId,
    notifId: notifId ?? this.notifId,
    createdAtMs: createdAtMs ?? this.createdAtMs,
    updatedAtMs: updatedAtMs ?? this.updatedAtMs,
  );
  ReminderRow copyWithCompanion(RemindersCompanion data) {
    return ReminderRow(
      id: data.id.present ? data.id.value : this.id,
      countdownId: data.countdownId.present
          ? data.countdownId.value
          : this.countdownId,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      offsetDays: data.offsetDays.present
          ? data.offsetDays.value
          : this.offsetDays,
      offsetHours: data.offsetHours.present
          ? data.offsetHours.value
          : this.offsetHours,
      offsetMinutes: data.offsetMinutes.present
          ? data.offsetMinutes.value
          : this.offsetMinutes,
      soundId: data.soundId.present ? data.soundId.value : this.soundId,
      notifId: data.notifId.present ? data.notifId.value : this.notifId,
      createdAtMs: data.createdAtMs.present
          ? data.createdAtMs.value
          : this.createdAtMs,
      updatedAtMs: data.updatedAtMs.present
          ? data.updatedAtMs.value
          : this.updatedAtMs,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRow(')
          ..write('id: $id, ')
          ..write('countdownId: $countdownId, ')
          ..write('enabled: $enabled, ')
          ..write('offsetDays: $offsetDays, ')
          ..write('offsetHours: $offsetHours, ')
          ..write('offsetMinutes: $offsetMinutes, ')
          ..write('soundId: $soundId, ')
          ..write('notifId: $notifId, ')
          ..write('createdAtMs: $createdAtMs, ')
          ..write('updatedAtMs: $updatedAtMs')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    countdownId,
    enabled,
    offsetDays,
    offsetHours,
    offsetMinutes,
    soundId,
    notifId,
    createdAtMs,
    updatedAtMs,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderRow &&
          other.id == this.id &&
          other.countdownId == this.countdownId &&
          other.enabled == this.enabled &&
          other.offsetDays == this.offsetDays &&
          other.offsetHours == this.offsetHours &&
          other.offsetMinutes == this.offsetMinutes &&
          other.soundId == this.soundId &&
          other.notifId == this.notifId &&
          other.createdAtMs == this.createdAtMs &&
          other.updatedAtMs == this.updatedAtMs);
}

class RemindersCompanion extends UpdateCompanion<ReminderRow> {
  final Value<String> id;
  final Value<String> countdownId;
  final Value<bool> enabled;
  final Value<int> offsetDays;
  final Value<int> offsetHours;
  final Value<int> offsetMinutes;
  final Value<String> soundId;
  final Value<int> notifId;
  final Value<int> createdAtMs;
  final Value<int> updatedAtMs;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.countdownId = const Value.absent(),
    this.enabled = const Value.absent(),
    this.offsetDays = const Value.absent(),
    this.offsetHours = const Value.absent(),
    this.offsetMinutes = const Value.absent(),
    this.soundId = const Value.absent(),
    this.notifId = const Value.absent(),
    this.createdAtMs = const Value.absent(),
    this.updatedAtMs = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    required String id,
    required String countdownId,
    this.enabled = const Value.absent(),
    this.offsetDays = const Value.absent(),
    this.offsetHours = const Value.absent(),
    this.offsetMinutes = const Value.absent(),
    this.soundId = const Value.absent(),
    required int notifId,
    required int createdAtMs,
    required int updatedAtMs,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       countdownId = Value(countdownId),
       notifId = Value(notifId),
       createdAtMs = Value(createdAtMs),
       updatedAtMs = Value(updatedAtMs);
  static Insertable<ReminderRow> custom({
    Expression<String>? id,
    Expression<String>? countdownId,
    Expression<bool>? enabled,
    Expression<int>? offsetDays,
    Expression<int>? offsetHours,
    Expression<int>? offsetMinutes,
    Expression<String>? soundId,
    Expression<int>? notifId,
    Expression<int>? createdAtMs,
    Expression<int>? updatedAtMs,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (countdownId != null) 'countdown_id': countdownId,
      if (enabled != null) 'enabled': enabled,
      if (offsetDays != null) 'offset_days': offsetDays,
      if (offsetHours != null) 'offset_hours': offsetHours,
      if (offsetMinutes != null) 'offset_minutes': offsetMinutes,
      if (soundId != null) 'sound_id': soundId,
      if (notifId != null) 'notif_id': notifId,
      if (createdAtMs != null) 'created_at_ms': createdAtMs,
      if (updatedAtMs != null) 'updated_at_ms': updatedAtMs,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? countdownId,
    Value<bool>? enabled,
    Value<int>? offsetDays,
    Value<int>? offsetHours,
    Value<int>? offsetMinutes,
    Value<String>? soundId,
    Value<int>? notifId,
    Value<int>? createdAtMs,
    Value<int>? updatedAtMs,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      countdownId: countdownId ?? this.countdownId,
      enabled: enabled ?? this.enabled,
      offsetDays: offsetDays ?? this.offsetDays,
      offsetHours: offsetHours ?? this.offsetHours,
      offsetMinutes: offsetMinutes ?? this.offsetMinutes,
      soundId: soundId ?? this.soundId,
      notifId: notifId ?? this.notifId,
      createdAtMs: createdAtMs ?? this.createdAtMs,
      updatedAtMs: updatedAtMs ?? this.updatedAtMs,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (countdownId.present) {
      map['countdown_id'] = Variable<String>(countdownId.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (offsetDays.present) {
      map['offset_days'] = Variable<int>(offsetDays.value);
    }
    if (offsetHours.present) {
      map['offset_hours'] = Variable<int>(offsetHours.value);
    }
    if (offsetMinutes.present) {
      map['offset_minutes'] = Variable<int>(offsetMinutes.value);
    }
    if (soundId.present) {
      map['sound_id'] = Variable<String>(soundId.value);
    }
    if (notifId.present) {
      map['notif_id'] = Variable<int>(notifId.value);
    }
    if (createdAtMs.present) {
      map['created_at_ms'] = Variable<int>(createdAtMs.value);
    }
    if (updatedAtMs.present) {
      map['updated_at_ms'] = Variable<int>(updatedAtMs.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('countdownId: $countdownId, ')
          ..write('enabled: $enabled, ')
          ..write('offsetDays: $offsetDays, ')
          ..write('offsetHours: $offsetHours, ')
          ..write('offsetMinutes: $offsetMinutes, ')
          ..write('soundId: $soundId, ')
          ..write('notifId: $notifId, ')
          ..write('createdAtMs: $createdAtMs, ')
          ..write('updatedAtMs: $updatedAtMs, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, CategoryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0xFF8E8E93),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, colorValue, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class CategoryRow extends DataClass implements Insertable<CategoryRow> {
  final String id;
  final String name;
  final int colorValue;
  final int sortOrder;
  const CategoryRow({
    required this.id,
    required this.name,
    required this.colorValue,
    required this.sortOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color_value'] = Variable<int>(colorValue);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      colorValue: Value(colorValue),
      sortOrder: Value(sortOrder),
    );
  }

  factory CategoryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorValue: serializer.fromJson<int>(json['colorValue']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorValue': serializer.toJson<int>(colorValue),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  CategoryRow copyWith({
    String? id,
    String? name,
    int? colorValue,
    int? sortOrder,
  }) => CategoryRow(
    id: id ?? this.id,
    name: name ?? this.name,
    colorValue: colorValue ?? this.colorValue,
    sortOrder: sortOrder ?? this.sortOrder,
  );
  CategoryRow copyWithCompanion(CategoriesCompanion data) {
    return CategoryRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorValue: $colorValue, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorValue, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorValue == this.colorValue &&
          other.sortOrder == this.sortOrder);
}

class CategoriesCompanion extends UpdateCompanion<CategoryRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> colorValue;
  final Value<int> sortOrder;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required String name,
    this.colorValue = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<CategoryRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? colorValue,
    Expression<int>? sortOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorValue != null) 'color_value': colorValue,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? colorValue,
    Value<int>? sortOrder,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorValue: colorValue ?? this.colorValue,
      sortOrder: sortOrder ?? this.sortOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorValue: $colorValue, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CountdownsTable countdowns = $CountdownsTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    countdowns,
    reminders,
    categories,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'countdowns',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('reminders', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CountdownsTableCreateCompanionBuilder =
    CountdownsCompanion Function({
      required String id,
      required String title,
      Value<String?> note,
      required int targetMs,
      Value<String> tzName,
      Value<bool> allDay,
      required CalendarType calendarType,
      Value<bool> lunarLeapMonth,
      required Direction direction,
      required Precision precision,
      required RepeatRule repeatRule,
      Value<int> repeatInterval,
      Value<String?> categoryId,
      Value<int> colorValue,
      Value<String> icon,
      Value<String?> coverPath,
      Value<bool> pinned,
      Value<int> sortOrder,
      required int createdAtMs,
      required int updatedAtMs,
      Value<String?> remoteId,
      Value<SyncState> syncState,
      Value<bool> deleted,
      Value<int> rowid,
    });
typedef $$CountdownsTableUpdateCompanionBuilder =
    CountdownsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> note,
      Value<int> targetMs,
      Value<String> tzName,
      Value<bool> allDay,
      Value<CalendarType> calendarType,
      Value<bool> lunarLeapMonth,
      Value<Direction> direction,
      Value<Precision> precision,
      Value<RepeatRule> repeatRule,
      Value<int> repeatInterval,
      Value<String?> categoryId,
      Value<int> colorValue,
      Value<String> icon,
      Value<String?> coverPath,
      Value<bool> pinned,
      Value<int> sortOrder,
      Value<int> createdAtMs,
      Value<int> updatedAtMs,
      Value<String?> remoteId,
      Value<SyncState> syncState,
      Value<bool> deleted,
      Value<int> rowid,
    });

final class $$CountdownsTableReferences
    extends BaseReferences<_$AppDatabase, $CountdownsTable, CountdownRow> {
  $$CountdownsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RemindersTable, List<ReminderRow>>
  _remindersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reminders,
    aliasName: 'countdowns__id__reminders__countdown_id',
  );

  $$RemindersTableProcessedTableManager get remindersRefs {
    final manager = $$RemindersTableTableManager(
      $_db,
      $_db.reminders,
    ).filter((f) => f.countdownId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CountdownsTableFilterComposer
    extends Composer<_$AppDatabase, $CountdownsTable> {
  $$CountdownsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetMs => $composableBuilder(
    column: $table.targetMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tzName => $composableBuilder(
    column: $table.tzName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get allDay => $composableBuilder(
    column: $table.allDay,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<CalendarType, CalendarType, int>
  get calendarType => $composableBuilder(
    column: $table.calendarType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get lunarLeapMonth => $composableBuilder(
    column: $table.lunarLeapMonth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Direction, Direction, int> get direction =>
      $composableBuilder(
        column: $table.direction,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Precision, Precision, int> get precision =>
      $composableBuilder(
        column: $table.precision,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<RepeatRule, RepeatRule, int> get repeatRule =>
      $composableBuilder(
        column: $table.repeatRule,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get repeatInterval => $composableBuilder(
    column: $table.repeatInterval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverPath => $composableBuilder(
    column: $table.coverPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pinned => $composableBuilder(
    column: $table.pinned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAtMs => $composableBuilder(
    column: $table.createdAtMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAtMs => $composableBuilder(
    column: $table.updatedAtMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncState, SyncState, int> get syncState =>
      $composableBuilder(
        column: $table.syncState,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> remindersRefs(
    Expression<bool> Function($$RemindersTableFilterComposer f) f,
  ) {
    final $$RemindersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.countdownId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableFilterComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CountdownsTableOrderingComposer
    extends Composer<_$AppDatabase, $CountdownsTable> {
  $$CountdownsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetMs => $composableBuilder(
    column: $table.targetMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tzName => $composableBuilder(
    column: $table.tzName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get allDay => $composableBuilder(
    column: $table.allDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get calendarType => $composableBuilder(
    column: $table.calendarType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get lunarLeapMonth => $composableBuilder(
    column: $table.lunarLeapMonth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get direction => $composableBuilder(
    column: $table.direction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get precision => $composableBuilder(
    column: $table.precision,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repeatRule => $composableBuilder(
    column: $table.repeatRule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repeatInterval => $composableBuilder(
    column: $table.repeatInterval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverPath => $composableBuilder(
    column: $table.coverPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pinned => $composableBuilder(
    column: $table.pinned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAtMs => $composableBuilder(
    column: $table.createdAtMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAtMs => $composableBuilder(
    column: $table.updatedAtMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CountdownsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CountdownsTable> {
  $$CountdownsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<int> get targetMs =>
      $composableBuilder(column: $table.targetMs, builder: (column) => column);

  GeneratedColumn<String> get tzName =>
      $composableBuilder(column: $table.tzName, builder: (column) => column);

  GeneratedColumn<bool> get allDay =>
      $composableBuilder(column: $table.allDay, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CalendarType, int> get calendarType =>
      $composableBuilder(
        column: $table.calendarType,
        builder: (column) => column,
      );

  GeneratedColumn<bool> get lunarLeapMonth => $composableBuilder(
    column: $table.lunarLeapMonth,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Direction, int> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Precision, int> get precision =>
      $composableBuilder(column: $table.precision, builder: (column) => column);

  GeneratedColumnWithTypeConverter<RepeatRule, int> get repeatRule =>
      $composableBuilder(
        column: $table.repeatRule,
        builder: (column) => column,
      );

  GeneratedColumn<int> get repeatInterval => $composableBuilder(
    column: $table.repeatInterval,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get coverPath =>
      $composableBuilder(column: $table.coverPath, builder: (column) => column);

  GeneratedColumn<bool> get pinned =>
      $composableBuilder(column: $table.pinned, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<int> get createdAtMs => $composableBuilder(
    column: $table.createdAtMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updatedAtMs => $composableBuilder(
    column: $table.updatedAtMs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncState, int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

  Expression<T> remindersRefs<T extends Object>(
    Expression<T> Function($$RemindersTableAnnotationComposer a) f,
  ) {
    final $$RemindersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.countdownId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableAnnotationComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CountdownsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CountdownsTable,
          CountdownRow,
          $$CountdownsTableFilterComposer,
          $$CountdownsTableOrderingComposer,
          $$CountdownsTableAnnotationComposer,
          $$CountdownsTableCreateCompanionBuilder,
          $$CountdownsTableUpdateCompanionBuilder,
          (CountdownRow, $$CountdownsTableReferences),
          CountdownRow,
          PrefetchHooks Function({bool remindersRefs})
        > {
  $$CountdownsTableTableManager(_$AppDatabase db, $CountdownsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CountdownsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CountdownsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CountdownsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int> targetMs = const Value.absent(),
                Value<String> tzName = const Value.absent(),
                Value<bool> allDay = const Value.absent(),
                Value<CalendarType> calendarType = const Value.absent(),
                Value<bool> lunarLeapMonth = const Value.absent(),
                Value<Direction> direction = const Value.absent(),
                Value<Precision> precision = const Value.absent(),
                Value<RepeatRule> repeatRule = const Value.absent(),
                Value<int> repeatInterval = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<int> colorValue = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<String?> coverPath = const Value.absent(),
                Value<bool> pinned = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> createdAtMs = const Value.absent(),
                Value<int> updatedAtMs = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<SyncState> syncState = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CountdownsCompanion(
                id: id,
                title: title,
                note: note,
                targetMs: targetMs,
                tzName: tzName,
                allDay: allDay,
                calendarType: calendarType,
                lunarLeapMonth: lunarLeapMonth,
                direction: direction,
                precision: precision,
                repeatRule: repeatRule,
                repeatInterval: repeatInterval,
                categoryId: categoryId,
                colorValue: colorValue,
                icon: icon,
                coverPath: coverPath,
                pinned: pinned,
                sortOrder: sortOrder,
                createdAtMs: createdAtMs,
                updatedAtMs: updatedAtMs,
                remoteId: remoteId,
                syncState: syncState,
                deleted: deleted,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> note = const Value.absent(),
                required int targetMs,
                Value<String> tzName = const Value.absent(),
                Value<bool> allDay = const Value.absent(),
                required CalendarType calendarType,
                Value<bool> lunarLeapMonth = const Value.absent(),
                required Direction direction,
                required Precision precision,
                required RepeatRule repeatRule,
                Value<int> repeatInterval = const Value.absent(),
                Value<String?> categoryId = const Value.absent(),
                Value<int> colorValue = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<String?> coverPath = const Value.absent(),
                Value<bool> pinned = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                required int createdAtMs,
                required int updatedAtMs,
                Value<String?> remoteId = const Value.absent(),
                Value<SyncState> syncState = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CountdownsCompanion.insert(
                id: id,
                title: title,
                note: note,
                targetMs: targetMs,
                tzName: tzName,
                allDay: allDay,
                calendarType: calendarType,
                lunarLeapMonth: lunarLeapMonth,
                direction: direction,
                precision: precision,
                repeatRule: repeatRule,
                repeatInterval: repeatInterval,
                categoryId: categoryId,
                colorValue: colorValue,
                icon: icon,
                coverPath: coverPath,
                pinned: pinned,
                sortOrder: sortOrder,
                createdAtMs: createdAtMs,
                updatedAtMs: updatedAtMs,
                remoteId: remoteId,
                syncState: syncState,
                deleted: deleted,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CountdownsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({remindersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (remindersRefs) db.reminders],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (remindersRefs)
                    await $_getPrefetchedData<
                      CountdownRow,
                      $CountdownsTable,
                      ReminderRow
                    >(
                      currentTable: table,
                      referencedTable: $$CountdownsTableReferences
                          ._remindersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CountdownsTableReferences(
                            db,
                            table,
                            p0,
                          ).remindersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.countdownId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CountdownsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CountdownsTable,
      CountdownRow,
      $$CountdownsTableFilterComposer,
      $$CountdownsTableOrderingComposer,
      $$CountdownsTableAnnotationComposer,
      $$CountdownsTableCreateCompanionBuilder,
      $$CountdownsTableUpdateCompanionBuilder,
      (CountdownRow, $$CountdownsTableReferences),
      CountdownRow,
      PrefetchHooks Function({bool remindersRefs})
    >;
typedef $$RemindersTableCreateCompanionBuilder =
    RemindersCompanion Function({
      required String id,
      required String countdownId,
      Value<bool> enabled,
      Value<int> offsetDays,
      Value<int> offsetHours,
      Value<int> offsetMinutes,
      Value<String> soundId,
      required int notifId,
      required int createdAtMs,
      required int updatedAtMs,
      Value<int> rowid,
    });
typedef $$RemindersTableUpdateCompanionBuilder =
    RemindersCompanion Function({
      Value<String> id,
      Value<String> countdownId,
      Value<bool> enabled,
      Value<int> offsetDays,
      Value<int> offsetHours,
      Value<int> offsetMinutes,
      Value<String> soundId,
      Value<int> notifId,
      Value<int> createdAtMs,
      Value<int> updatedAtMs,
      Value<int> rowid,
    });

final class $$RemindersTableReferences
    extends BaseReferences<_$AppDatabase, $RemindersTable, ReminderRow> {
  $$RemindersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CountdownsTable _countdownIdTable(_$AppDatabase db) =>
      db.countdowns.createAlias('reminders__countdown_id__countdowns__id');

  $$CountdownsTableProcessedTableManager get countdownId {
    final $_column = $_itemColumn<String>('countdown_id')!;

    final manager = $$CountdownsTableTableManager(
      $_db,
      $_db.countdowns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_countdownIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get offsetDays => $composableBuilder(
    column: $table.offsetDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get offsetHours => $composableBuilder(
    column: $table.offsetHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get offsetMinutes => $composableBuilder(
    column: $table.offsetMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get soundId => $composableBuilder(
    column: $table.soundId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notifId => $composableBuilder(
    column: $table.notifId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAtMs => $composableBuilder(
    column: $table.createdAtMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAtMs => $composableBuilder(
    column: $table.updatedAtMs,
    builder: (column) => ColumnFilters(column),
  );

  $$CountdownsTableFilterComposer get countdownId {
    final $$CountdownsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countdownId,
      referencedTable: $db.countdowns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountdownsTableFilterComposer(
            $db: $db,
            $table: $db.countdowns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get offsetDays => $composableBuilder(
    column: $table.offsetDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get offsetHours => $composableBuilder(
    column: $table.offsetHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get offsetMinutes => $composableBuilder(
    column: $table.offsetMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get soundId => $composableBuilder(
    column: $table.soundId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notifId => $composableBuilder(
    column: $table.notifId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAtMs => $composableBuilder(
    column: $table.createdAtMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAtMs => $composableBuilder(
    column: $table.updatedAtMs,
    builder: (column) => ColumnOrderings(column),
  );

  $$CountdownsTableOrderingComposer get countdownId {
    final $$CountdownsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countdownId,
      referencedTable: $db.countdowns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountdownsTableOrderingComposer(
            $db: $db,
            $table: $db.countdowns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<int> get offsetDays => $composableBuilder(
    column: $table.offsetDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get offsetHours => $composableBuilder(
    column: $table.offsetHours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get offsetMinutes => $composableBuilder(
    column: $table.offsetMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get soundId =>
      $composableBuilder(column: $table.soundId, builder: (column) => column);

  GeneratedColumn<int> get notifId =>
      $composableBuilder(column: $table.notifId, builder: (column) => column);

  GeneratedColumn<int> get createdAtMs => $composableBuilder(
    column: $table.createdAtMs,
    builder: (column) => column,
  );

  GeneratedColumn<int> get updatedAtMs => $composableBuilder(
    column: $table.updatedAtMs,
    builder: (column) => column,
  );

  $$CountdownsTableAnnotationComposer get countdownId {
    final $$CountdownsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.countdownId,
      referencedTable: $db.countdowns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CountdownsTableAnnotationComposer(
            $db: $db,
            $table: $db.countdowns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          ReminderRow,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (ReminderRow, $$RemindersTableReferences),
          ReminderRow,
          PrefetchHooks Function({bool countdownId})
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> countdownId = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> offsetDays = const Value.absent(),
                Value<int> offsetHours = const Value.absent(),
                Value<int> offsetMinutes = const Value.absent(),
                Value<String> soundId = const Value.absent(),
                Value<int> notifId = const Value.absent(),
                Value<int> createdAtMs = const Value.absent(),
                Value<int> updatedAtMs = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                countdownId: countdownId,
                enabled: enabled,
                offsetDays: offsetDays,
                offsetHours: offsetHours,
                offsetMinutes: offsetMinutes,
                soundId: soundId,
                notifId: notifId,
                createdAtMs: createdAtMs,
                updatedAtMs: updatedAtMs,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String countdownId,
                Value<bool> enabled = const Value.absent(),
                Value<int> offsetDays = const Value.absent(),
                Value<int> offsetHours = const Value.absent(),
                Value<int> offsetMinutes = const Value.absent(),
                Value<String> soundId = const Value.absent(),
                required int notifId,
                required int createdAtMs,
                required int updatedAtMs,
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                countdownId: countdownId,
                enabled: enabled,
                offsetDays: offsetDays,
                offsetHours: offsetHours,
                offsetMinutes: offsetMinutes,
                soundId: soundId,
                notifId: notifId,
                createdAtMs: createdAtMs,
                updatedAtMs: updatedAtMs,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RemindersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({countdownId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (countdownId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.countdownId,
                                referencedTable: $$RemindersTableReferences
                                    ._countdownIdTable(db),
                                referencedColumn: $$RemindersTableReferences
                                    ._countdownIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      ReminderRow,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (ReminderRow, $$RemindersTableReferences),
      ReminderRow,
      PrefetchHooks Function({bool countdownId})
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      required String id,
      required String name,
      Value<int> colorValue,
      Value<int> sortOrder,
      Value<int> rowid,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> colorValue,
      Value<int> sortOrder,
      Value<int> rowid,
    });

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          CategoryRow,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (
            CategoryRow,
            BaseReferences<_$AppDatabase, $CategoriesTable, CategoryRow>,
          ),
          CategoryRow,
          PrefetchHooks Function()
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> colorValue = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                colorValue: colorValue,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<int> colorValue = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                colorValue: colorValue,
                sortOrder: sortOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      CategoryRow,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (
        CategoryRow,
        BaseReferences<_$AppDatabase, $CategoriesTable, CategoryRow>,
      ),
      CategoryRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CountdownsTableTableManager get countdowns =>
      $$CountdownsTableTableManager(_db, _db.countdowns);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
}
