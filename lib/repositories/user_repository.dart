import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../models/user_profile.dart';

/// Repository for managing local user profile
class UserRepository {
  static const String _boxName = 'userBox';
  static const String _profileKey = 'currentUser';
  static const _uuid = Uuid();

  Box<UserProfile> get _box => Hive.box<UserProfile>(_boxName);

  /// Get the current user profile, creating one if it doesn't exist
  UserProfile getCurrentUser() {
    final profile = _box.get(_profileKey);
    if (profile != null) {
      return profile;
    }

    // Create a new local user profile on first launch
    final newProfile = UserProfile(
      id: _uuid.v4(),
      createdAt: DateTime.now(),
      displayName: 'Archer', // Default name, user can change later
    );

    _box.put(_profileKey, newProfile);
    return newProfile;
  }

  /// Update user profile
  Future<void> updateProfile(UserProfile profile) async {
    await _box.put(_profileKey, profile);
  }

  /// Check if user has a profile
  bool hasProfile() {
    return _box.containsKey(_profileKey);
  }

  /// Clear user profile (for testing or account switching)
  Future<void> clearProfile() async {
    await _box.delete(_profileKey);
  }
}
