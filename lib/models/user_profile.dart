import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
@HiveType(typeId: 0)
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @HiveField(0) required String id, // Local UUID or Firebase UID
    @HiveField(1) String? displayName, // For leaderboards
    @HiveField(2) String? email,
    @HiveField(3) @Default(false) bool isPublic, // Opt-in to leagues
    @HiveField(4) required DateTime createdAt,
    @HiveField(5) @Default(false) bool isSynced, // Has Firebase account
    // Future: leagueTier, weeklyPoints, currentStreak
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
