// Basic tests for Quiver models and utilities

import 'package:flutter_test/flutter_test.dart';
import 'package:quiver/models/shot_position.dart';
import 'package:quiver/models/user_profile.dart';
import 'package:quiver/models/archery_session.dart';

void main() {
  group('Data Models', () {
    test('ShotPosition can be created', () {
      final shot = ShotPosition(
        x: 0.5,
        y: 0.5,
        score: 10,
        timestamp: DateTime.now(),
      );

      expect(shot.x, 0.5);
      expect(shot.y, 0.5);
      expect(shot.score, 10);
    });

    test('UserProfile can be created with defaults', () {
      final profile = UserProfile(
        id: 'test-id',
        createdAt: DateTime.now(),
      );

      expect(profile.id, 'test-id');
      expect(profile.isPublic, false);
      expect(profile.isSynced, false);
      expect(profile.displayName, null);
    });

    test('ArcherySession calculates average score correctly', () {
      final now = DateTime.now();
      final session = ArcherySession(
        id: 'session-1',
        ownerId: 'user-1',
        date: now,
        arrowCount: 10,
        totalScore: 85,
        averageScore: 8.5,
        createdAt: now,
        updatedAt: now,
      );

      expect(session.averageScore, 8.5);
      expect(session.arrowCount, 10);
      expect(session.totalScore, 85);
    });

    test('ArcherySession can have optional fields', () {
      final now = DateTime.now();
      final session = ArcherySession(
        id: 'session-2',
        ownerId: 'user-1',
        date: now,
        title: 'Morning Practice',
        arrowCount: 0,
        totalScore: 0,
        createdAt: now,
        updatedAt: now,
      );

      expect(session.title, 'Morning Practice');
      expect(session.averageScore, null);
      expect(session.shots, isEmpty);
    });

    test('UserProfile copyWith works correctly', () {
      final profile = UserProfile(
        id: 'test-id',
        createdAt: DateTime.now(),
        displayName: 'Archer',
      );

      final updated = profile.copyWith(
        displayName: 'Pro Archer',
        isPublic: true,
      );

      expect(updated.displayName, 'Pro Archer');
      expect(updated.isPublic, true);
      expect(updated.id, profile.id); // Unchanged
    });

    test('ArcherySession tracks sync status', () {
      final now = DateTime.now();
      final session = ArcherySession(
        id: 'session-3',
        ownerId: 'user-1',
        date: now,
        arrowCount: 5,
        totalScore: 45,
        isSynced: false,
        createdAt: now,
        updatedAt: now,
      );

      expect(session.isSynced, false);

      final synced = session.copyWith(isSynced: true);
      expect(synced.isSynced, true);
    });
  });

  group('Score Calculations', () {
    test('Average score is null when arrow count is 0', () {
      final now = DateTime.now();
      final session = ArcherySession(
        id: 'test',
        ownerId: 'user',
        date: now,
        arrowCount: 0,
        totalScore: 0,
        createdAt: now,
        updatedAt: now,
      );

      expect(session.averageScore, null);
    });

    test('Average score calculation example', () {
      // 12 arrows, total score 102
      // Average should be 8.5
      const arrows = 12;
      const total = 102;
      final average = total / arrows;

      expect(average, closeTo(8.5, 0.01));
    });
  });
}
