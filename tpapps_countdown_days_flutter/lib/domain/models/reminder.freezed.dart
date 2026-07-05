// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reminder {

 String get id; String get countdownId; bool get enabled; int get offsetDays; int get offsetHours; int get offsetMinutes; String get soundId;/// Stable 32-bit id used to schedule/cancel the OS notification.
 int get notifId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderCopyWith<Reminder> get copyWith => _$ReminderCopyWithImpl<Reminder>(this as Reminder, _$identity);

  /// Serializes this Reminder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reminder&&(identical(other.id, id) || other.id == id)&&(identical(other.countdownId, countdownId) || other.countdownId == countdownId)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.offsetDays, offsetDays) || other.offsetDays == offsetDays)&&(identical(other.offsetHours, offsetHours) || other.offsetHours == offsetHours)&&(identical(other.offsetMinutes, offsetMinutes) || other.offsetMinutes == offsetMinutes)&&(identical(other.soundId, soundId) || other.soundId == soundId)&&(identical(other.notifId, notifId) || other.notifId == notifId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,countdownId,enabled,offsetDays,offsetHours,offsetMinutes,soundId,notifId,createdAt,updatedAt);

@override
String toString() {
  return 'Reminder(id: $id, countdownId: $countdownId, enabled: $enabled, offsetDays: $offsetDays, offsetHours: $offsetHours, offsetMinutes: $offsetMinutes, soundId: $soundId, notifId: $notifId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReminderCopyWith<$Res>  {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) _then) = _$ReminderCopyWithImpl;
@useResult
$Res call({
 String id, String countdownId, bool enabled, int offsetDays, int offsetHours, int offsetMinutes, String soundId, int notifId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ReminderCopyWithImpl<$Res>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._self, this._then);

  final Reminder _self;
  final $Res Function(Reminder) _then;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? countdownId = null,Object? enabled = null,Object? offsetDays = null,Object? offsetHours = null,Object? offsetMinutes = null,Object? soundId = null,Object? notifId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,countdownId: null == countdownId ? _self.countdownId : countdownId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,offsetDays: null == offsetDays ? _self.offsetDays : offsetDays // ignore: cast_nullable_to_non_nullable
as int,offsetHours: null == offsetHours ? _self.offsetHours : offsetHours // ignore: cast_nullable_to_non_nullable
as int,offsetMinutes: null == offsetMinutes ? _self.offsetMinutes : offsetMinutes // ignore: cast_nullable_to_non_nullable
as int,soundId: null == soundId ? _self.soundId : soundId // ignore: cast_nullable_to_non_nullable
as String,notifId: null == notifId ? _self.notifId : notifId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Reminder].
extension ReminderPatterns on Reminder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reminder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reminder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reminder value)  $default,){
final _that = this;
switch (_that) {
case _Reminder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reminder value)?  $default,){
final _that = this;
switch (_that) {
case _Reminder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String countdownId,  bool enabled,  int offsetDays,  int offsetHours,  int offsetMinutes,  String soundId,  int notifId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reminder() when $default != null:
return $default(_that.id,_that.countdownId,_that.enabled,_that.offsetDays,_that.offsetHours,_that.offsetMinutes,_that.soundId,_that.notifId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String countdownId,  bool enabled,  int offsetDays,  int offsetHours,  int offsetMinutes,  String soundId,  int notifId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Reminder():
return $default(_that.id,_that.countdownId,_that.enabled,_that.offsetDays,_that.offsetHours,_that.offsetMinutes,_that.soundId,_that.notifId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String countdownId,  bool enabled,  int offsetDays,  int offsetHours,  int offsetMinutes,  String soundId,  int notifId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Reminder() when $default != null:
return $default(_that.id,_that.countdownId,_that.enabled,_that.offsetDays,_that.offsetHours,_that.offsetMinutes,_that.soundId,_that.notifId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reminder extends Reminder {
  const _Reminder({required this.id, required this.countdownId, this.enabled = true, this.offsetDays = 0, this.offsetHours = 0, this.offsetMinutes = 0, this.soundId = 'default', required this.notifId, required this.createdAt, required this.updatedAt}): super._();
  factory _Reminder.fromJson(Map<String, dynamic> json) => _$ReminderFromJson(json);

@override final  String id;
@override final  String countdownId;
@override@JsonKey() final  bool enabled;
@override@JsonKey() final  int offsetDays;
@override@JsonKey() final  int offsetHours;
@override@JsonKey() final  int offsetMinutes;
@override@JsonKey() final  String soundId;
/// Stable 32-bit id used to schedule/cancel the OS notification.
@override final  int notifId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderCopyWith<_Reminder> get copyWith => __$ReminderCopyWithImpl<_Reminder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reminder&&(identical(other.id, id) || other.id == id)&&(identical(other.countdownId, countdownId) || other.countdownId == countdownId)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.offsetDays, offsetDays) || other.offsetDays == offsetDays)&&(identical(other.offsetHours, offsetHours) || other.offsetHours == offsetHours)&&(identical(other.offsetMinutes, offsetMinutes) || other.offsetMinutes == offsetMinutes)&&(identical(other.soundId, soundId) || other.soundId == soundId)&&(identical(other.notifId, notifId) || other.notifId == notifId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,countdownId,enabled,offsetDays,offsetHours,offsetMinutes,soundId,notifId,createdAt,updatedAt);

@override
String toString() {
  return 'Reminder(id: $id, countdownId: $countdownId, enabled: $enabled, offsetDays: $offsetDays, offsetHours: $offsetHours, offsetMinutes: $offsetMinutes, soundId: $soundId, notifId: $notifId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReminderCopyWith<$Res> implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) _then) = __$ReminderCopyWithImpl;
@override @useResult
$Res call({
 String id, String countdownId, bool enabled, int offsetDays, int offsetHours, int offsetMinutes, String soundId, int notifId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ReminderCopyWithImpl<$Res>
    implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(this._self, this._then);

  final _Reminder _self;
  final $Res Function(_Reminder) _then;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? countdownId = null,Object? enabled = null,Object? offsetDays = null,Object? offsetHours = null,Object? offsetMinutes = null,Object? soundId = null,Object? notifId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Reminder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,countdownId: null == countdownId ? _self.countdownId : countdownId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,offsetDays: null == offsetDays ? _self.offsetDays : offsetDays // ignore: cast_nullable_to_non_nullable
as int,offsetHours: null == offsetHours ? _self.offsetHours : offsetHours // ignore: cast_nullable_to_non_nullable
as int,offsetMinutes: null == offsetMinutes ? _self.offsetMinutes : offsetMinutes // ignore: cast_nullable_to_non_nullable
as int,soundId: null == soundId ? _self.soundId : soundId // ignore: cast_nullable_to_non_nullable
as String,notifId: null == notifId ? _self.notifId : notifId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
