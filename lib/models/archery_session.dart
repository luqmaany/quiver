import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'shot_position.dart';

part 'archery_session.freezed.dart';
part 'archery_session.g.dart';

@freezed
@HiveType(typeId: 1)
class ArcherySession with _$ArcherySession {
  const factory ArcherySession({
    @HiveField(0) required String id,
    @HiveField(1) required String ownerId, // Owner ID (local or Firebase)
    @HiveField(2) required DateTime date,
    @HiveField(3) String? title, // "Morning practice", etc.
    @HiveField(4) required int arrowCount,
    @HiveField(5) required int totalScore, // Sum of shot scores (for league points)
    @HiveField(6) double? averageScore, // Derived (for stats/leagues)
    @HiveField(7) @Default([]) List<ShotPosition> shots, // For Phase 2
    @HiveField(8) String? voiceNotePath, // For Phase 3 (local file path)
    @HiveField(9) String? voiceNoteUrl, // For Phase 3 (cloud URL after sync)
    @HiveField(10) String? transcription, // For Phase 3
    @HiveField(11) @Default(false) bool isSynced, // Synced to cloud?
    @HiveField(12) required DateTime createdAt,
    @HiveField(13) required DateTime updatedAt,
  }) = _ArcherySession;

  factory ArcherySession.fromJson(Map<String, dynamic> json) =>
      _$ArcherySessionFromJson(json);
}
