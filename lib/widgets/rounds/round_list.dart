import 'package:flutter/material.dart';
import '../../models/archery_round.dart';
import 'round_card.dart';
import 'add_round_dialog.dart';

class RoundList extends StatelessWidget {
  final String sessionId;
  final List<ArcheryRound> rounds;
  final Function(ArcheryRound) onRoundAdded;
  final Function(String roundId) onRoundDeleted;

  const RoundList({
    super.key,
    required this.sessionId,
    required this.rounds,
    required this.onRoundAdded,
    required this.onRoundDeleted,
  });

  Future<void> _showAddRoundDialog(BuildContext context) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => const AddRoundDialog(),
    );

    if (result != null && context.mounted) {
      final round = ArcheryRound(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        distance: result['distance'],
        distanceUnit: result['distanceUnit'],
        targetType: result['targetType'],
        shots: [],
        arrowCount: 0,
        totalScore: 0,
        averageScore: null,
        createdAt: DateTime.now(),
      );
      onRoundAdded(round);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (rounds.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.track_changes,
                size: 64,
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
              ),
              const SizedBox(height: 16),
              Text(
                'No rounds yet',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Tap the + button to add your first round',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => _showAddRoundDialog(context),
                icon: const Icon(Icons.add),
                label: const Text('Add Round'),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Rounds list
        ...rounds.asMap().entries.map((entry) {
          final index = entry.key;
          final round = entry.value;
          
          return RoundCard(
            sessionId: sessionId,
            round: round,
            roundNumber: index + 1,
            onDelete: () => _confirmDelete(context, round.id),
          );
        }),
        
        // Add round button
        Padding(
          padding: const EdgeInsets.all(16),
          child: OutlinedButton.icon(
            onPressed: () => _showAddRoundDialog(context),
            icon: const Icon(Icons.add),
            label: const Text('Add Round'),
          ),
        ),
      ],
    );
  }

  Future<void> _confirmDelete(BuildContext context, String roundId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Round'),
        content: const Text('Are you sure you want to delete this round? This action cannot be undone.'),
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
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      onRoundDeleted(roundId);
    }
  }
}
