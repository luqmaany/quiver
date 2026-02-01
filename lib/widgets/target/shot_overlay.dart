import 'package:flutter/material.dart';
import '../../models/shot_position.dart';

/// Visualization mode for shot markers
enum ShotVisualizationMode {
  simpleDots,
  numbered,
  colorCoded,
  numberedColorCoded,
}

/// Painter for rendering shot markers on target
class ShotOverlayPainter extends CustomPainter {
  final List<ShotPosition> shots;
  final ShotVisualizationMode mode;
  final double targetRadius;

  ShotOverlayPainter({
    required this.shots,
    required this.mode,
    required this.targetRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < shots.length; i++) {
      final shot = shots[i];
      final shotPosition = _getShotPosition(shot, center, targetRadius);
      
      switch (mode) {
        case ShotVisualizationMode.simpleDots:
          _drawSimpleDot(canvas, shotPosition);
          break;
        case ShotVisualizationMode.numbered:
          _drawNumberedShot(canvas, shotPosition, i + 1, Colors.red);
          break;
        case ShotVisualizationMode.colorCoded:
          _drawColorCodedShot(canvas, shotPosition, shot.score);
          break;
        case ShotVisualizationMode.numberedColorCoded:
          _drawNumberedShot(
            canvas,
            shotPosition,
            i + 1,
            _getColorForScore(shot.score),
          );
          break;
      }
    }
  }

  /// Convert normalized coordinates to screen position
  Offset _getShotPosition(ShotPosition shot, Offset center, double radius) {
    // shot.x and shot.y are normalized 0-1, with 0.5,0.5 being center
    final relativeX = (shot.x - 0.5) * 2 * radius;
    final relativeY = (shot.y - 0.5) * 2 * radius;
    return Offset(center.dx + relativeX, center.dy + relativeY);
  }

  /// Draw a simple dot marker
  void _drawSimpleDot(Canvas canvas, Offset position) {
    // Outer circle (white border)
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(position, 8, borderPaint);

    // Inner circle (red)
    final dotPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(position, 6, dotPaint);
  }

  /// Draw a numbered shot marker
  void _drawNumberedShot(Canvas canvas, Offset position, int number, Color color) {
    // Outer circle (white border)
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(position, 14, borderPaint);

    // Inner circle (colored)
    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(position, 12, dotPaint);

    // Draw number
    final textSpan = TextSpan(
      text: number.toString(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      position - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }

  /// Draw a color-coded shot marker
  void _drawColorCodedShot(Canvas canvas, Offset position, int score) {
    final color = _getColorForScore(score);

    // Outer circle (white border)
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(position, 10, borderPaint);

    // Inner circle (colored by score)
    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(position, 8, dotPaint);
  }

  /// Get color based on score (10=green, 1=red gradient)
  Color _getColorForScore(int score) {
    if (score >= 10) return Colors.green.shade700;
    if (score >= 9) return Colors.lightGreen;
    if (score >= 8) return Colors.yellow.shade700;
    if (score >= 7) return Colors.orange;
    if (score >= 6) return Colors.deepOrange;
    if (score >= 5) return Colors.red;
    return Colors.red.shade900;
  }

  @override
  bool shouldRepaint(ShotOverlayPainter oldDelegate) {
    return shots != oldDelegate.shots ||
        mode != oldDelegate.mode ||
        targetRadius != oldDelegate.targetRadius;
  }
}

/// Interactive widget for handling shot placement
class ShotOverlay extends StatelessWidget {
  final List<ShotPosition> shots;
  final Function(Offset) onTap;
  final ShotVisualizationMode visualMode;
  final double targetRadius;
  final bool allowInteraction;

  const ShotOverlay({
    super.key,
    required this.shots,
    required this.onTap,
    required this.targetRadius,
    this.visualMode = ShotVisualizationMode.numberedColorCoded,
    this.allowInteraction = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: allowInteraction
          ? (details) => onTap(details.localPosition)
          : null,
      child: CustomPaint(
        painter: ShotOverlayPainter(
          shots: shots,
          mode: visualMode,
          targetRadius: targetRadius,
        ),
        size: Size.infinite,
      ),
    );
  }
}
