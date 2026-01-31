import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/archery_session.dart';
import '../models/user_profile.dart';
import '../repositories/local_session_repository.dart';
import 'user_provider.dart';

const _uuid = Uuid();

// Provider for the LocalSessionRepository instance
final sessionRepositoryProvider = Provider<LocalSessionRepository>((ref) {
  return LocalSessionRepository();
});

// Provider for all sessions
final sessionListProvider =
    StateNotifierProvider<SessionListNotifier, List<ArcherySession>>((ref) {
  final repository = ref.watch(sessionRepositoryProvider);
  return SessionListNotifier(repository);
});

class SessionListNotifier extends StateNotifier<List<ArcherySession>> {
  final LocalSessionRepository _repository;

  SessionListNotifier(this._repository) : super(_repository.getAllSessions());

  void refresh() {
    state = _repository.getAllSessions();
  }

  Future<void> addSession(ArcherySession session) async {
    await _repository.saveSession(session);
    refresh();
  }

  Future<void> updateSession(ArcherySession session) async {
    final updatedSession = session.copyWith(updatedAt: DateTime.now());
    await _repository.saveSession(updatedSession);
    refresh();
  }

  Future<void> deleteSession(String id) async {
    await _repository.deleteSession(id);
    refresh();
  }

  List<ArcherySession> getSessionsByDateRange(DateTime start, DateTime end) {
    return _repository.getSessionsByDateRange(start, end);
  }
}

// Provider for a single session by ID
final sessionProvider =
    Provider.family<ArcherySession?, String>((ref, id) {
  final sessions = ref.watch(sessionListProvider);
  try {
    return sessions.firstWhere((session) => session.id == id);
  } catch (e) {
    return null;
  }
});

// Helper provider to create a new session
final createSessionProvider = Provider<CreateSessionHelper>((ref) {
  final repository = ref.watch(sessionRepositoryProvider);
  final user = ref.watch(userProfileProvider);
  final sessionNotifier = ref.read(sessionListProvider.notifier);
  return CreateSessionHelper(repository, user, sessionNotifier);
});

class CreateSessionHelper {
  final LocalSessionRepository _repository;
  final UserProfile userProfile;
  final SessionListNotifier _notifier;

  CreateSessionHelper(this._repository, this.userProfile, this._notifier);

  Future<ArcherySession> createNewSession({
    String? title,
    int arrowCount = 0,
    int totalScore = 0,
  }) async {
    final now = DateTime.now();
    final session = ArcherySession(
      id: _uuid.v4(),
      ownerId: userProfile.id,
      date: now,
      title: title,
      arrowCount: arrowCount,
      totalScore: totalScore,
      averageScore: arrowCount > 0 ? totalScore / arrowCount : null,
      createdAt: now,
      updatedAt: now,
    );

    await _repository.saveSession(session);
    _notifier.refresh();
    return session;
  }
}
