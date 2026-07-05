// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

 AppLocaleOption get locale; AppThemeMode get themeMode; Precision get defaultPrecision; bool get firstDayMonday; bool get showLunar; String get defaultSoundId;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.defaultPrecision, defaultPrecision) || other.defaultPrecision == defaultPrecision)&&(identical(other.firstDayMonday, firstDayMonday) || other.firstDayMonday == firstDayMonday)&&(identical(other.showLunar, showLunar) || other.showLunar == showLunar)&&(identical(other.defaultSoundId, defaultSoundId) || other.defaultSoundId == defaultSoundId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,themeMode,defaultPrecision,firstDayMonday,showLunar,defaultSoundId);

@override
String toString() {
  return 'AppSettings(locale: $locale, themeMode: $themeMode, defaultPrecision: $defaultPrecision, firstDayMonday: $firstDayMonday, showLunar: $showLunar, defaultSoundId: $defaultSoundId)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 AppLocaleOption locale, AppThemeMode themeMode, Precision defaultPrecision, bool firstDayMonday, bool showLunar, String defaultSoundId
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,Object? themeMode = null,Object? defaultPrecision = null,Object? firstDayMonday = null,Object? showLunar = null,Object? defaultSoundId = null,}) {
  return _then(_self.copyWith(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as AppLocaleOption,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,defaultPrecision: null == defaultPrecision ? _self.defaultPrecision : defaultPrecision // ignore: cast_nullable_to_non_nullable
as Precision,firstDayMonday: null == firstDayMonday ? _self.firstDayMonday : firstDayMonday // ignore: cast_nullable_to_non_nullable
as bool,showLunar: null == showLunar ? _self.showLunar : showLunar // ignore: cast_nullable_to_non_nullable
as bool,defaultSoundId: null == defaultSoundId ? _self.defaultSoundId : defaultSoundId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppLocaleOption locale,  AppThemeMode themeMode,  Precision defaultPrecision,  bool firstDayMonday,  bool showLunar,  String defaultSoundId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.locale,_that.themeMode,_that.defaultPrecision,_that.firstDayMonday,_that.showLunar,_that.defaultSoundId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppLocaleOption locale,  AppThemeMode themeMode,  Precision defaultPrecision,  bool firstDayMonday,  bool showLunar,  String defaultSoundId)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.locale,_that.themeMode,_that.defaultPrecision,_that.firstDayMonday,_that.showLunar,_that.defaultSoundId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppLocaleOption locale,  AppThemeMode themeMode,  Precision defaultPrecision,  bool firstDayMonday,  bool showLunar,  String defaultSoundId)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.locale,_that.themeMode,_that.defaultPrecision,_that.firstDayMonday,_that.showLunar,_that.defaultSoundId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings implements AppSettings {
  const _AppSettings({this.locale = AppLocaleOption.system, this.themeMode = AppThemeMode.system, this.defaultPrecision = Precision.day, this.firstDayMonday = false, this.showLunar = true, this.defaultSoundId = 'default'});
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

@override@JsonKey() final  AppLocaleOption locale;
@override@JsonKey() final  AppThemeMode themeMode;
@override@JsonKey() final  Precision defaultPrecision;
@override@JsonKey() final  bool firstDayMonday;
@override@JsonKey() final  bool showLunar;
@override@JsonKey() final  String defaultSoundId;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.defaultPrecision, defaultPrecision) || other.defaultPrecision == defaultPrecision)&&(identical(other.firstDayMonday, firstDayMonday) || other.firstDayMonday == firstDayMonday)&&(identical(other.showLunar, showLunar) || other.showLunar == showLunar)&&(identical(other.defaultSoundId, defaultSoundId) || other.defaultSoundId == defaultSoundId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,themeMode,defaultPrecision,firstDayMonday,showLunar,defaultSoundId);

@override
String toString() {
  return 'AppSettings(locale: $locale, themeMode: $themeMode, defaultPrecision: $defaultPrecision, firstDayMonday: $firstDayMonday, showLunar: $showLunar, defaultSoundId: $defaultSoundId)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 AppLocaleOption locale, AppThemeMode themeMode, Precision defaultPrecision, bool firstDayMonday, bool showLunar, String defaultSoundId
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = null,Object? themeMode = null,Object? defaultPrecision = null,Object? firstDayMonday = null,Object? showLunar = null,Object? defaultSoundId = null,}) {
  return _then(_AppSettings(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as AppLocaleOption,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as AppThemeMode,defaultPrecision: null == defaultPrecision ? _self.defaultPrecision : defaultPrecision // ignore: cast_nullable_to_non_nullable
as Precision,firstDayMonday: null == firstDayMonday ? _self.firstDayMonday : firstDayMonday // ignore: cast_nullable_to_non_nullable
as bool,showLunar: null == showLunar ? _self.showLunar : showLunar // ignore: cast_nullable_to_non_nullable
as bool,defaultSoundId: null == defaultSoundId ? _self.defaultSoundId : defaultSoundId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
