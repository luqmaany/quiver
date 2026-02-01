import 'package:flutter/material.dart';
import '../../models/target_type.dart';
import '../../models/target_spec.dart';
import '../../models/shot_position.dart';
import 'target_painter.dart';
import 'target_factory.dart';
import 'shot_overlay.dart';
import 'dart:math' as math;

/// Main widget for displaying and interacting with archery targets
class TargetWidget extends StatefulWidget {
  final TargetType targetType;
  final List<ShotPosition> shots;
  final Function(ShotPosition) onShotAdded;
  final bool allowInteraction;
  final ShotVisualizationMode visualMode;
  final double size;

  const TargetWidget({
    super.key,
    required this.targetType,
    required this.shots,
    required this.onShotAdded,
    this.allowInteraction = true,
    this.visualMode = ShotVisualizationMode.numberedColorCoded,
    this.size = 300,
  });

  @override
  State<TargetWidget> createState() => _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  late TargetSpec _spec;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _spec = TargetFactory.getSpec(widget.targetType, context);
  }

  @override
  void didUpdateWidget(TargetWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.targetType != widget.targetType) {
      _spec = TargetFactory.getSpec(widget.targetType, context);
    }
  }

  void _handleTap(Offset localPosition) {
    if (!widget.allowInteraction) return;

    // Convert screen coordinates to normalized coordinates (0-1)
    final center = Offset(widget.size / 2, widget.size / 2);
    final radius = widget.size / 2;

    // Calculate relative position from center
    final dx = localPosition.dx - center.dx;
    final dy = localPosition.dy - center.dy;

    // Normalize to 0-1 range (0.5, 0.5 is center)
    final normalizedX = 0.5 + (dx / (radius * 2));
    final normalizedY = 0.5 + (dy / (radius * 2));

    // Calculate distance from center for scoring
    final distanceFromCenter = math.sqrt(dx * dx + dy * dy) / radius;

    // Calculate score based on distance
    final score = _spec.calculateScore(distanceFromCenter);

    // Create shot position
    final shot = ShotPosition(
      x: normalizedX,
      y: normalizedY,
      score: score,
      timestamp: DateTime.now(),
    );

    widget.onShotAdded(shot);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Target face
          CustomPaint(
            painter: TargetPainter(spec: _spec),
            size: Size(widget.size, widget.size),
          ),
          // Shot overlay
          ShotOverlay(
            shots: widget.shots,
            onTap: _handleTap,
            targetRadius: widget.size / 2,
            visualMode: widget.visualMode,
            allowInteraction: widget.allowInteraction,
          ),
        ],
      ),
    );
  }
}
