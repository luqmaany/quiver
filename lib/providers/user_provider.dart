import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_profile.dart';
import '../repositories/user_repository.dart';

// Provider for the UserRepository instance
final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

// Provider for the current user profile
final userProfileProvider = Provider<UserProfile>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return repository.getCurrentUser();
});

// StateProvider for updating user profile
final userProfileNotifierProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfile>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return UserProfileNotifier(repository);
});

class UserProfileNotifier extends StateNotifier<UserProfile> {
  final UserRepository _repository;

  UserProfileNotifier(this._repository) : super(_repository.getCurrentUser());

  Future<void> updateProfile(UserProfile profile) async {
    await _repository.updateProfile(profile);
    state = profile;
  }

  Future<void> updateDisplayName(String displayName) async {
    final updatedProfile = state.copyWith(displayName: displayName);
    await updateProfile(updatedProfile);
  }

  Future<void> updateEmail(String email) async {
    final updatedProfile = state.copyWith(email: email);
    await updateProfile(updatedProfile);
  }

  Future<void> togglePublicProfile() async {
    final updatedProfile = state.copyWith(isPublic: !state.isPublic);
    await updateProfile(updatedProfile);
  }
}
