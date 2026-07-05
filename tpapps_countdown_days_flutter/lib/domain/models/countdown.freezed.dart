// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countdown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Countdown {

 String get id; String get title; String? get note; DateTime get target; bool get allDay; CalendarType get calendarType; bool get lunarLeapMonth; Direction get direction; Precision get precision; RepeatRule get repeatRule; int get repeatInterval; String? get categoryId; int get colorValue; String get icon; String? get coverPath; bool get pinned; int get sortOrder; List<Reminder> get reminders; DateTime get createdAt; DateTime get updatedAt; String? get remoteId; SyncState get syncState; bool get deleted;
/// Create a copy of Countdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountdownCopyWith<Countdown> get copyWith => _$CountdownCopyWithImpl<Countdown>(this as Countdown, _$identity);

  /// Serializes this Countdown to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Countdown&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.note, note) || other.note == note)&&(identical(other.target, target) || other.target == target)&&(identical(other.allDay, allDay) || other.allDay == allDay)&&(identical(other.calendarType, calendarType) || other.calendarType == calendarType)&&(identical(other.lunarLeapMonth, lunarLeapMonth) || other.lunarLeapMonth == lunarLeapMonth)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.precision, precision) || other.precision == precision)&&(identical(other.repeatRule, repeatRule) || other.repeatRule == repeatRule)&&(identical(other.repeatInterval, repeatInterval) || other.repeatInterval == repeatInterval)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.reminders, reminders)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,note,target,allDay,calendarType,lunarLeapMonth,direction,precision,repeatRule,repeatInterval,categoryId,colorValue,icon,coverPath,pinned,sortOrder,const DeepCollectionEquality().hash(reminders),createdAt,updatedAt,remoteId,syncState,deleted]);

@override
String toString() {
  return 'Countdown(id: $id, title: $title, note: $note, target: $target, allDay: $allDay, calendarType: $calendarType, lunarLeapMonth: $lunarLeapMonth, direction: $direction, precision: $precision, repeatRule: $repeatRule, repeatInterval: $repeatInterval, categoryId: $categoryId, colorValue: $colorValue, icon: $icon, coverPath: $coverPath, pinned: $pinned, sortOrder: $sortOrder, reminders: $reminders, createdAt: $createdAt, updatedAt: $updatedAt, remoteId: $remoteId, syncState: $syncState, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $CountdownCopyWith<$Res>  {
  factory $CountdownCopyWith(Countdown value, $Res Function(Countdown) _then) = _$CountdownCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? note, DateTime target, bool allDay, CalendarType calendarType, bool lunarLeapMonth, Direction direction, Precision precision, RepeatRule repeatRule, int repeatInterval, String? categoryId, int colorValue, String icon, String? coverPath, bool pinned, int sortOrder, List<Reminder> reminders, DateTime createdAt, DateTime updatedAt, String? remoteId, SyncState syncState, bool deleted
});




}
/// @nodoc
class _$CountdownCopyWithImpl<$Res>
    implements $CountdownCopyWith<$Res> {
  _$CountdownCopyWithImpl(this._self, this._then);

  final Countdown _self;
  final $Res Function(Countdown) _then;

/// Create a copy of Countdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? note = freezed,Object? target = null,Object? allDay = null,Object? calendarType = null,Object? lunarLeapMonth = null,Object? direction = null,Object? precision = null,Object? repeatRule = null,Object? repeatInterval = null,Object? categoryId = freezed,Object? colorValue = null,Object? icon = null,Object? coverPath = freezed,Object? pinned = null,Object? sortOrder = null,Object? reminders = null,Object? createdAt = null,Object? updatedAt = null,Object? remoteId = freezed,Object? syncState = null,Object? deleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as DateTime,allDay: null == allDay ? _self.allDay : allDay // ignore: cast_nullable_to_non_nullable
as bool,calendarType: null == calendarType ? _self.calendarType : calendarType // ignore: cast_nullable_to_non_nullable
as CalendarType,lunarLeapMonth: null == lunarLeapMonth ? _self.lunarLeapMonth : lunarLeapMonth // ignore: cast_nullable_to_non_nullable
as bool,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,precision: null == precision ? _self.precision : precision // ignore: cast_nullable_to_non_nullable
as Precision,repeatRule: null == repeatRule ? _self.repeatRule : repeatRule // ignore: cast_nullable_to_non_nullable
as RepeatRule,repeatInterval: null == repeatInterval ? _self.repeatInterval : repeatInterval // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,reminders: null == reminders ? _self.reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<Reminder>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as String?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Countdown].
extension CountdownPatterns on Countdown {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Countdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Countdown() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Countdown value)  $default,){
final _that = this;
switch (_that) {
case _Countdown():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Countdown value)?  $default,){
final _that = this;
switch (_that) {
case _Countdown() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? note,  DateTime target,  bool allDay,  CalendarType calendarType,  bool lunarLeapMonth,  Direction direction,  Precision precision,  RepeatRule repeatRule,  int repeatInterval,  String? categoryId,  int colorValue,  String icon,  String? coverPath,  bool pinned,  int sortOrder,  List<Reminder> reminders,  DateTime createdAt,  DateTime updatedAt,  String? remoteId,  SyncState syncState,  bool deleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Countdown() when $default != null:
return $default(_that.id,_that.title,_that.note,_that.target,_that.allDay,_that.calendarType,_that.lunarLeapMonth,_that.direction,_that.precision,_that.repeatRule,_that.repeatInterval,_that.categoryId,_that.colorValue,_that.icon,_that.coverPath,_that.pinned,_that.sortOrder,_that.reminders,_that.createdAt,_that.updatedAt,_that.remoteId,_that.syncState,_that.deleted);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? note,  DateTime target,  bool allDay,  CalendarType calendarType,  bool lunarLeapMonth,  Direction direction,  Precision precision,  RepeatRule repeatRule,  int repeatInterval,  String? categoryId,  int colorValue,  String icon,  String? coverPath,  bool pinned,  int sortOrder,  List<Reminder> reminders,  DateTime createdAt,  DateTime updatedAt,  String? remoteId,  SyncState syncState,  bool deleted)  $default,) {final _that = this;
switch (_that) {
case _Countdown():
return $default(_that.id,_that.title,_that.note,_that.target,_that.allDay,_that.calendarType,_that.lunarLeapMonth,_that.direction,_that.precision,_that.repeatRule,_that.repeatInterval,_that.categoryId,_that.colorValue,_that.icon,_that.coverPath,_that.pinned,_that.sortOrder,_that.reminders,_that.createdAt,_that.updatedAt,_that.remoteId,_that.syncState,_that.deleted);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? note,  DateTime target,  bool allDay,  CalendarType calendarType,  bool lunarLeapMonth,  Direction direction,  Precision precision,  RepeatRule repeatRule,  int repeatInterval,  String? categoryId,  int colorValue,  String icon,  String? coverPath,  bool pinned,  int sortOrder,  List<Reminder> reminders,  DateTime createdAt,  DateTime updatedAt,  String? remoteId,  SyncState syncState,  bool deleted)?  $default,) {final _that = this;
switch (_that) {
case _Countdown() when $default != null:
return $default(_that.id,_that.title,_that.note,_that.target,_that.allDay,_that.calendarType,_that.lunarLeapMonth,_that.direction,_that.precision,_that.repeatRule,_that.repeatInterval,_that.categoryId,_that.colorValue,_that.icon,_that.coverPath,_that.pinned,_that.sortOrder,_that.reminders,_that.createdAt,_that.updatedAt,_that.remoteId,_that.syncState,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Countdown extends Countdown {
  const _Countdown({required this.id, required this.title, this.note, required this.target, this.allDay = true, this.calendarType = CalendarType.solar, this.lunarLeapMonth = false, this.direction = Direction.countdown, this.precision = Precision.day, this.repeatRule = RepeatRule.none, this.repeatInterval = 1, this.categoryId, this.colorValue = 0xFF0A84FF, this.icon = '📅', this.coverPath, this.pinned = false, this.sortOrder = 0, final  List<Reminder> reminders = const <Reminder>[], required this.createdAt, required this.updatedAt, this.remoteId, this.syncState = SyncState.localOnly, this.deleted = false}): _reminders = reminders,super._();
  factory _Countdown.fromJson(Map<String, dynamic> json) => _$CountdownFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? note;
@override final  DateTime target;
@override@JsonKey() final  bool allDay;
@override@JsonKey() final  CalendarType calendarType;
@override@JsonKey() final  bool lunarLeapMonth;
@override@JsonKey() final  Direction direction;
@override@JsonKey() final  Precision precision;
@override@JsonKey() final  RepeatRule repeatRule;
@override@JsonKey() final  int repeatInterval;
@override final  String? categoryId;
@override@JsonKey() final  int colorValue;
@override@JsonKey() final  String icon;
@override final  String? coverPath;
@override@JsonKey() final  bool pinned;
@override@JsonKey() final  int sortOrder;
 final  List<Reminder> _reminders;
@override@JsonKey() List<Reminder> get reminders {
  if (_reminders is EqualUnmodifiableListView) return _reminders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reminders);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? remoteId;
@override@JsonKey() final  SyncState syncState;
@override@JsonKey() final  bool deleted;

/// Create a copy of Countdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountdownCopyWith<_Countdown> get copyWith => __$CountdownCopyWithImpl<_Countdown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountdownToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Countdown&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.note, note) || other.note == note)&&(identical(other.target, target) || other.target == target)&&(identical(other.allDay, allDay) || other.allDay == allDay)&&(identical(other.calendarType, calendarType) || other.calendarType == calendarType)&&(identical(other.lunarLeapMonth, lunarLeapMonth) || other.lunarLeapMonth == lunarLeapMonth)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.precision, precision) || other.precision == precision)&&(identical(other.repeatRule, repeatRule) || other.repeatRule == repeatRule)&&(identical(other.repeatInterval, repeatInterval) || other.repeatInterval == repeatInterval)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other._reminders, _reminders)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId)&&(identical(other.syncState, syncState) || other.syncState == syncState)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,note,target,allDay,calendarType,lunarLeapMonth,direction,precision,repeatRule,repeatInterval,categoryId,colorValue,icon,coverPath,pinned,sortOrder,const DeepCollectionEquality().hash(_reminders),createdAt,updatedAt,remoteId,syncState,deleted]);

@override
String toString() {
  return 'Countdown(id: $id, title: $title, note: $note, target: $target, allDay: $allDay, calendarType: $calendarType, lunarLeapMonth: $lunarLeapMonth, direction: $direction, precision: $precision, repeatRule: $repeatRule, repeatInterval: $repeatInterval, categoryId: $categoryId, colorValue: $colorValue, icon: $icon, coverPath: $coverPath, pinned: $pinned, sortOrder: $sortOrder, reminders: $reminders, createdAt: $createdAt, updatedAt: $updatedAt, remoteId: $remoteId, syncState: $syncState, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$CountdownCopyWith<$Res> implements $CountdownCopyWith<$Res> {
  factory _$CountdownCopyWith(_Countdown value, $Res Function(_Countdown) _then) = __$CountdownCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? note, DateTime target, bool allDay, CalendarType calendarType, bool lunarLeapMonth, Direction direction, Precision precision, RepeatRule repeatRule, int repeatInterval, String? categoryId, int colorValue, String icon, String? coverPath, bool pinned, int sortOrder, List<Reminder> reminders, DateTime createdAt, DateTime updatedAt, String? remoteId, SyncState syncState, bool deleted
});




}
/// @nodoc
class __$CountdownCopyWithImpl<$Res>
    implements _$CountdownCopyWith<$Res> {
  __$CountdownCopyWithImpl(this._self, this._then);

  final _Countdown _self;
  final $Res Function(_Countdown) _then;

/// Create a copy of Countdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? note = freezed,Object? target = null,Object? allDay = null,Object? calendarType = null,Object? lunarLeapMonth = null,Object? direction = null,Object? precision = null,Object? repeatRule = null,Object? repeatInterval = null,Object? categoryId = freezed,Object? colorValue = null,Object? icon = null,Object? coverPath = freezed,Object? pinned = null,Object? sortOrder = null,Object? reminders = null,Object? createdAt = null,Object? updatedAt = null,Object? remoteId = freezed,Object? syncState = null,Object? deleted = null,}) {
  return _then(_Countdown(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as DateTime,allDay: null == allDay ? _self.allDay : allDay // ignore: cast_nullable_to_non_nullable
as bool,calendarType: null == calendarType ? _self.calendarType : calendarType // ignore: cast_nullable_to_non_nullable
as CalendarType,lunarLeapMonth: null == lunarLeapMonth ? _self.lunarLeapMonth : lunarLeapMonth // ignore: cast_nullable_to_non_nullable
as bool,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,precision: null == precision ? _self.precision : precision // ignore: cast_nullable_to_non_nullable
as Precision,repeatRule: null == repeatRule ? _self.repeatRule : repeatRule // ignore: cast_nullable_to_non_nullable
as RepeatRule,repeatInterval: null == repeatInterval ? _self.repeatInterval : repeatInterval // ignore: cast_nullable_to_non_nullable
as int,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,reminders: null == reminders ? _self._reminders : reminders // ignore: cast_nullable_to_non_nullable
as List<Reminder>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as String?,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
