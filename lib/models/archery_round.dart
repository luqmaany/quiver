import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'shot_position.dart';

part 'archery_round.freezed.dart';
part 'archery_round.g.dart';

@freezed
@HiveType(typeId: 3)
class ArcheryRound with _$ArcheryRound {
  const factory ArcheryRound({
    @HiveField(0) required String id,
    @HiveField(1) required int distance, // e.g., 70, 50, 18
    @HiveField(2) required String distanceUnit, // 'm' or 'yd'
    @HiveField(3) required String targetType, // 'wa10Ring122cm', etc.
    @HiveField(4) @Default([]) List<ShotPosition> shots,
    @HiveField(5) required int arrowCount,
    @HiveField(6) required int totalScore,
    @HiveField(7) double? averageScore,
    @HiveField(8) required DateTime createdAt,
  }) = _ArcheryRound;

  factory ArcheryRound.fromJson(Map<String, dynamic> json) =>
      _$ArcheryRoundFromJson(json);
}
