import 'package:flutter/material.dart';
import '../../models/target_spec.dart';

/// Custom painter for rendering archery target faces
class TargetPainter extends CustomPainter {
  final TargetSpec spec;
  final double strokeWidth;

  TargetPainter({
    required this.spec,
    this.strokeWidth = 1.5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = spec.backgroundColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    canvas.drawCircle(center, maxRadius, backgroundPaint);

    // Draw rings from outside to inside (so inner rings overlay outer ones)
    for (int i = spec.rings.length - 1; i >= 0; i--) {
      final ring = spec.rings[i];
      final ringRadius = maxRadius * ring.radius;

      // Fill the ring
      final fillPaint = Paint()
        ..color = ring.color
        ..style = PaintingStyle.fill
        ..isAntiAlias = true
        ..filterQuality = FilterQuality.high;
      canvas.drawCircle(center, ringRadius, fillPaint);

      // Draw crisp ring border (black line)
      final borderPaint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..isAntiAlias = true
        ..filterQuality = FilterQuality.high;
      canvas.drawCircle(center, ringRadius, borderPaint);
    }

    // Draw score labels AFTER all rings (so they're on top)
    for (int i = spec.rings.length - 1; i >= 0; i--) {
      final ring = spec.rings[i];
      final ringRadius = maxRadius * ring.radius;

      if (ring.showScoreLabel && ringRadius > 30) {
        _drawScoreLabel(
          canvas,
          center,
          ringRadius,
          ring.score.toString(),
          ring.color,
        );
      }
    }

    // Draw X-ring indicator if present (after everything else)
    if (spec.hasXRing && spec.rings.isNotEmpty) {
      final xRing = spec.rings.first;
      final xRadius = maxRadius * xRing.radius;
      final xBorderPaint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth * 2
        ..isAntiAlias = true
        ..filterQuality = FilterQuality.high;
      canvas.drawCircle(center, xRadius, xBorderPaint);
    }
  }

  /// Draw score label on the ring
  void _drawScoreLabel(
    Canvas canvas,
    Offset center,
    double radius,
    String label,
    Color ringColor,
  ) {
    // Position label at top of ring
    final labelPosition = Offset(center.dx, center.dy - radius + 20);

    // Choose text color based on ring color brightness
    final textColor = _getContrastColor(ringColor);

    final textSpan = TextSpan(
      text: label,
      style: TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: textColor == Colors.white ? Colors.black : Colors.white,
            blurRadius: 2,
          ),
        ],
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    
    // Draw background circle for better visibility
    final textCenter = labelPosition;
    final backgroundPaint = Paint()
      ..color = (textColor == Colors.white ? Colors.black : Colors.white)
          .withValues(alpha: 0.7)
      ..isAntiAlias = true;
    canvas.drawCircle(textCenter, 16, backgroundPaint);
    
    // Draw text
    textPainter.paint(
      canvas,
      labelPosition - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  /// Get contrasting text color for readability
  Color _getContrastColor(Color background) {
    // Calculate relative luminance
    final luminance = (0.299 * background.r +
            0.587 * background.g +
            0.114 * background.b) /
        255;

    // Use white text on dark backgrounds, black on light
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  @override
  bool shouldRepaint(TargetPainter oldDelegate) {
    return spec != oldDelegate.spec || strokeWidth != oldDelegate.strokeWidth;
  }
}
