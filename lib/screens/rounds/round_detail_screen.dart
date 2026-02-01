import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/archery_round.dart';
import '../../models/shot_position.dart';
import '../../models/target_type.dart';
import '../../widgets/target/target_widget.dart';
import '../../widgets/target/shot_overlay.dart';
import '../../providers/session_provider.dart';

class RoundDetailScreen extends ConsumerWidget {
  final String sessionId;
  final String roundId;

  const RoundDetailScreen({
    super.key,
    required this.sessionId,
    required this.roundId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider(sessionId));
    
    if (session == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Session Not Found')),
        body: const Center(child: Text('Session not found')),
      );
    }

    final round = session.rounds.firstWhere(
      (r) => r.id == roundId,
      orElse: () => throw StateError('Round not found'),
    );

    final targetType = TargetType.fromId(round.targetType);
    final roundNumber = session.rounds.indexOf(round) + 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Round $roundNumber - ${round.distance}${round.distanceUnit}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/session/$sessionId'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showRoundInfo(context, round, targetType),
          ),
        ],
      ),
      body: Column(
        children: [
          // Stats header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Column(
              children: [
                Text(
                  targetType.displayName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatItem(
                      label: 'Arrows',
                      value: '${round.shots.length}',
                      icon: Icons.arrow_forward,
                    ),
                    _StatItem(
                      label: 'Score',
                      value: '${round.totalScore}',
                      icon: Icons.stars,
                    ),
                    if (round.averageScore != null)
                      _StatItem(
                        label: 'Average',
                        value: round.averageScore!.toStringAsFixed(1),
                        icon: Icons.show_chart,
                      ),
                  ],
                ),
              ],
            ),
          ),

          // Target
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: TargetWidget(
                    targetType: targetType,
                    shots: round.shots,
                    onShotAdded: (shot) => _addShot(ref, shot),
                    allowInteraction: true,
                    visualMode: ShotVisualizationMode.numberedColorCoded,
                    size: MediaQuery.of(context).size.width - 48,
                  ),
                ),
              ),
            ),
          ),

          // Controls
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  if (round.shots.isNotEmpty)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _undoLastShot(ref),
                        icon: const Icon(Icons.undo),
                        label: const Text('Undo'),
                      ),
                    ),
                  if (round.shots.isNotEmpty) const SizedBox(width: 12),
                  if (round.shots.isNotEmpty)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _clearAllShots(context, ref),
                        icon: const Icon(Icons.clear_all),
                        label: const Text('Clear'),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Shot list
          if (round.shots.isNotEmpty)
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: round.shots.length,
                itemBuilder: (context, index) {
                  final shot = round.shots[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _ShotChip(
                      number: index + 1,
                      score: shot.score,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  void _addShot(WidgetRef ref, ShotPosition shot) {
    ref.read(sessionListProvider.notifier).addShotToRound(
          sessionId,
          roundId,
          shot,
        );
  }

  void _undoLastShot(WidgetRef ref) {
    ref.read(sessionListProvider.notifier).undoLastShotInRound(
          sessionId,
          roundId,
        );
  }

  Future<void> _clearAllShots(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Shots'),
        content: const Text('Are you sure you want to remove all shots from this round?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final session = ref.read(sessionProvider(sessionId));
      if (session != null) {
        final round = session.rounds.firstWhere((r) => r.id == roundId);
        final clearedRound = round.copyWith(
          shots: [],
          arrowCount: 0,
          totalScore: 0,
          averageScore: null,
        );
        ref.read(sessionListProvider.notifier).updateRound(sessionId, clearedRound);
      }
    }
  }

  void _showRoundInfo(BuildContext context, ArcheryRound round, TargetType targetType) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Round Information',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              _InfoRow(label: 'Distance', value: '${round.distance}${round.distanceUnit}'),
              _InfoRow(label: 'Target', value: targetType.displayName),
              _InfoRow(label: 'Arrows', value: '${round.shots.length}'),
              _InfoRow(label: 'Total Score', value: '${round.totalScore}'),
              if (round.averageScore != null)
                _InfoRow(label: 'Average', value: round.averageScore!.toStringAsFixed(2)),
              const SizedBox(height: 16),
              const Text(
                'Tap the target to add shots. The score is calculated automatically based on where you tap.',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }
}

class _ShotChip extends StatelessWidget {
  final int number;
  final int score;

  const _ShotChip({
    required this.number,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: _getColorForScore(score),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '#$number',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$score',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Color _getColorForScore(int score) {
    if (score >= 10) return Colors.green.shade100;
    if (score >= 9) return Colors.lightGreen.shade100;
    if (score >= 8) return Colors.yellow.shade100;
    if (score >= 7) return Colors.orange.shade100;
    if (score >= 6) return Colors.deepOrange.shade100;
    return Colors.red.shade100;
  }
}
