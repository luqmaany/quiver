import 'package:flutter/material.dart';

/// Specification for a single ring in a target
class RingSpec {
  final double radius; // Normalized 0-1 (relative to target size)
  final Color color;
  final int score;
  final bool showScoreLabel;

  const RingSpec({
    required this.radius,
    required this.color,
    required this.score,
    this.showScoreLabel = false,
  });
}

/// Complete specification for a target face
class TargetSpec {
  final List<RingSpec> rings;
  final Color backgroundColor;
  final bool hasXRing; // Inner 10 ring

  const TargetSpec({
    required this.rings,
    this.backgroundColor = Colors.white,
    this.hasXRing = false,
  });

  /// Calculate score based on normalized distance from center
  int calculateScore(double distanceFromCenter) {
    // Find the ring that contains this distance
    for (final ring in rings) {
      if (distanceFromCenter <= ring.radius) {
        return ring.score;
      }
    }
    // Outside all rings = miss (0 points)
    return 0;
  }

  /// Get the ring specification for a given score
  RingSpec? getRingForScore(int score) {
    try {
      return rings.firstWhere((ring) => ring.score == score);
    } catch (e) {
      return null;
    }
  }
}
