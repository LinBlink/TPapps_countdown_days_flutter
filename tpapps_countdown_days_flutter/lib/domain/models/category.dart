import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

/// A user-defined grouping for countdowns (e.g. Work, Family, Holidays).
@freezed
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    @Default(0xFF8E8E93) int colorValue,
    @Default(0) int sortOrder,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
