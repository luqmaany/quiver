import 'package:flutter/material.dart';
import '../../models/target_type.dart';
import '../../models/target_spec.dart';

/// Factory class for creating target specifications
class TargetFactory {
  /// Get the specification for a given target type
  static TargetSpec getSpec(TargetType type, BuildContext context) {
    switch (type) {
      case TargetType.wa10Ring122cm:
      case TargetType.wa10Ring80cm:
      case TargetType.wa10Ring40cm:
        return _buildWA10RingSpec(context);
      case TargetType.wa6Ring80cm:
        return _buildWA6RingSpec(context);
      case TargetType.waTripleSpot:
        return _buildWATripleSpotSpec(context);
      case TargetType.vegas3Spot:
        return _buildVegas3SpotSpec(context);
      case TargetType.nfaaField:
        return _buildNFAAFieldSpec(context);
      case TargetType.nfaaIndoor5Spot:
        return _buildNFAAIndoor5SpotSpec(context);
    }
  }

  /// Build WA 10-ring target specification
  /// Based on World Archery standard target face
  static TargetSpec _buildWA10RingSpec(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    // Colors adapted for light/dark mode
    final gold = isDark ? const Color(0xFFD4AF37).withValues(alpha: 0.85) : const Color(0xFFFFD700);
    final red = isDark ? const Color(0xFFCC3333).withValues(alpha: 0.85) : const Color(0xFFFF0000);
    final blue = isDark ? const Color(0xFF4169AA).withValues(alpha: 0.85) : const Color(0xFF0066FF);
    // Black not used for rings in WA target
    final white = isDark ? const Color(0xFFCCCCCC) : const Color(0xFFFFFFFF);

    // WA 10-ring target has 11 scoring zones
    // Each ring is 6.1cm wide on a 122cm face (radius 61cm)
    // Normalized radii from center (0.0) to edge (1.0)
    return TargetSpec(
      rings: [
        // X-ring (inner 10) - 3.05cm radius = 0.05
        RingSpec(radius: 0.05, color: gold, score: 10, showScoreLabel: false),
        // Outer 10 - 6.1cm radius = 0.10
        RingSpec(radius: 0.10, color: gold, score: 10, showScoreLabel: true),
        // Inner 9 - 12.2cm radius = 0.20
        RingSpec(radius: 0.20, color: gold, score: 9, showScoreLabel: false),
        // Outer 9 - 18.3cm radius = 0.30
        RingSpec(radius: 0.30, color: gold, score: 9, showScoreLabel: true),
        // Inner 8 - 24.4cm radius = 0.40
        RingSpec(radius: 0.40, color: red, score: 8, showScoreLabel: false),
        // Outer 8 - 30.5cm radius = 0.50
        RingSpec(radius: 0.50, color: red, score: 8, showScoreLabel: true),
        // Inner 7 - 36.6cm radius = 0.60
        RingSpec(radius: 0.60, color: red, score: 7, showScoreLabel: false),
        // Outer 7 - 42.7cm radius = 0.70
        RingSpec(radius: 0.70, color: red, score: 7, showScoreLabel: true),
        // Inner 6 - 48.8cm radius = 0.80
        RingSpec(radius: 0.80, color: blue, score: 6, showScoreLabel: false),
        // Outer 6 - 54.9cm radius = 0.90
        RingSpec(radius: 0.90, color: blue, score: 6, showScoreLabel: true),
        // Inner 5 - 61cm radius = 1.0 (full target)
        RingSpec(radius: 1.0, color: blue, score: 5, showScoreLabel: false),
      ],
      backgroundColor: white,
      hasXRing: true,
    );
  }

  /// Placeholder for WA 6-ring compound target
  static TargetSpec _buildWA6RingSpec(BuildContext context) {
    // For now, return same as 10-ring (will implement later)
    return _buildWA10RingSpec(context);
  }

  /// Placeholder for WA Triple Spot
  static TargetSpec _buildWATripleSpotSpec(BuildContext context) {
    return _buildWA10RingSpec(context);
  }

  /// Placeholder for Vegas 3-Spot
  static TargetSpec _buildVegas3SpotSpec(BuildContext context) {
    return _buildWA10RingSpec(context);
  }

  /// Placeholder for NFAA Field
  static TargetSpec _buildNFAAFieldSpec(BuildContext context) {
    return _buildWA10RingSpec(context);
  }

  /// Placeholder for NFAA Indoor 5-Spot
  static TargetSpec _buildNFAAIndoor5SpotSpec(BuildContext context) {
    return _buildWA10RingSpec(context);
  }

  /// Suggest a target type based on distance
  static TargetType suggestTarget(int distance, String unit) {
    if (unit == 'm') {
      if (distance >= 60) return TargetType.wa10Ring122cm;
      if (distance >= 30) return TargetType.wa10Ring80cm;
      return TargetType.wa10Ring40cm;
    } else {
      // Yards
      if (distance >= 65) return TargetType.wa10Ring122cm;
      if (distance >= 30) return TargetType.wa10Ring80cm;
      return TargetType.wa10Ring40cm;
    }
  }
}
