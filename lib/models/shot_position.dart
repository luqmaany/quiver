import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'shot_position.freezed.dart';
part 'shot_position.g.dart';

@freezed
@HiveType(typeId: 2)
class ShotPosition with _$ShotPosition {
  const factory ShotPosition({
    @HiveField(0) required double x, // Normalized 0-1
    @HiveField(1) required double y, // Normalized 0-1
    @HiveField(2) required int score, // Ring value (10, 9, 8...)
    @HiveField(3) required DateTime timestamp, // When shot was logged
  }) = _ShotPosition;

  factory ShotPosition.fromJson(Map<String, dynamic> json) =>
      _$ShotPositionFromJson(json);
}
