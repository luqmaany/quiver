import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/archery_round.dart';
import '../../models/target_type.dart';

class RoundCard extends StatelessWidget {
  final String sessionId;
  final ArcheryRound round;
  final int roundNumber;
  final VoidCallback? onDelete;

  const RoundCard({
    super.key,
    required this.sessionId,
    required this.round,
    required this.roundNumber,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final targetType = TargetType.fromId(round.targetType);
    
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => context.go('/session/$sessionId/round/${round.id}'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Round number badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Round $roundNumber',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Distance and target info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${round.distance}${round.distanceUnit}',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          targetType.displayName,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                  // Arrow icon
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  if (onDelete != null)
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: onDelete,
                      tooltip: 'Delete round',
                    ),
                ],
              ),
              const SizedBox(height: 12),
              // Stats row
              Row(
                children: [
                  _StatChip(
                    icon: Icons.arrow_forward,
                    label: '${round.shots.length} arrows',
                  ),
                  const SizedBox(width: 8),
                  _StatChip(
                    icon: Icons.stars,
                    label: '${round.totalScore} pts',
                  ),
                  if (round.averageScore != null) ...[
                    const SizedBox(width: 8),
                    _StatChip(
                      icon: Icons.show_chart,
                      label: 'Avg: ${round.averageScore!.toStringAsFixed(1)}',
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
