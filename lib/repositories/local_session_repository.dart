import 'package:hive/hive.dart';
import '../models/archery_session.dart';

/// Local repository for managing archery sessions using Hive
/// Interface designed for easy cloud sync addition later
class LocalSessionRepository {
  static const String _boxName = 'sessionsBox';

  Box<ArcherySession> get _box => Hive.box<ArcherySession>(_boxName);

  /// Get all sessions sorted by date (newest first)
  List<ArcherySession> getAllSessions() {
    final sessions = _box.values.toList();
    sessions.sort((a, b) => b.date.compareTo(a.date));
    return sessions;
  }

  /// Get a specific session by ID
  ArcherySession? getSession(String id) {
    return _box.values.firstWhere(
      (session) => session.id == id,
      orElse: () => throw Exception('Session not found'),
    );
  }

  /// Save a new session or update existing one
  Future<void> saveSession(ArcherySession session) async {
    await _box.put(session.id, session);
  }

  /// Delete a session by ID
  Future<void> deleteSession(String id) async {
    await _box.delete(id);
  }

  /// Get session count
  int getSessionCount() {
    return _box.length;
  }

  /// Get sessions for a specific date range
  List<ArcherySession> getSessionsByDateRange(DateTime start, DateTime end) {
    return _box.values
        .where((session) =>
            session.date.isAfter(start.subtract(const Duration(days: 1))) &&
            session.date.isBefore(end.add(const Duration(days: 1))))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  /// Get sessions that haven't been synced to cloud
  List<ArcherySession> getUnsyncedSessions() {
    return _box.values.where((session) => !session.isSynced).toList();
  }

  /// Clear all sessions (use with caution)
  Future<void> clearAll() async {
    await _box.clear();
  }
}
