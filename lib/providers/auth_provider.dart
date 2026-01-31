import 'package:flutter_riverpod/flutter_riverpod.dart';

// Placeholder for future Firebase auth integration
// This will be implemented in Phase 4 when cloud sync is added

class AuthState {
  final bool isAuthenticated;
  final String? userId;
  final String? email;

  AuthState({
    required this.isAuthenticated,
    this.userId,
    this.email,
  });
}

// Provider for auth state (currently always unauthenticated)
final authStateProvider = StateProvider<AuthState>((ref) {
  return AuthState(isAuthenticated: false);
});

// This will be expanded in Phase 4 to include:
// - Firebase Auth integration
// - Sign in/Sign up methods
// - Auth state stream
// - Cloud sync triggers
