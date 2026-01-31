import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/session_provider.dart';
import '../../models/archery_session.dart';

class SessionDetailScreen extends ConsumerStatefulWidget {
  final String sessionId;

  const SessionDetailScreen({super.key, required this.sessionId});

  @override
  ConsumerState<SessionDetailScreen> createState() =>
      _SessionDetailScreenState();
}

class _SessionDetailScreenState extends ConsumerState<SessionDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _arrowCountController;
  late TextEditingController _scoreController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _arrowCountController = TextEditingController();
    _scoreController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _arrowCountController.dispose();
    _scoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider(widget.sessionId));

    if (session == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Session Not Found'),
        ),
        body: const Center(
          child: Text('Session not found'),
        ),
      );
    }

    // Initialize controllers with session data
    if (_titleController.text.isEmpty) {
      _titleController.text = session.title ?? '';
      _arrowCountController.text = session.arrowCount.toString();
      _scoreController.text = session.totalScore.toString();
    }

    final dateFormat = DateFormat('EEEE, MMM dd, yyyy • HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => _saveSession(session),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date display
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      dateFormat.format(session.date),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Title field
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Session Title',
                hintText: 'e.g., Morning Practice',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),
            const SizedBox(height: 16),

            // Arrow count field
            TextField(
              controller: _arrowCountController,
              decoration: const InputDecoration(
                labelText: 'Number of Arrows',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.arrow_forward),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Score field
            TextField(
              controller: _scoreController,
              decoration: const InputDecoration(
                labelText: 'Total Score',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.stars),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),

            // Stats card
            if (session.averageScore != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Statistics',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      _StatRow(
                        label: 'Average Score',
                        value: session.averageScore!.toStringAsFixed(2),
                        icon: Icons.show_chart,
                      ),
                      const Divider(height: 24),
                      _StatRow(
                        label: 'Total Arrows',
                        value: session.arrowCount.toString(),
                        icon: Icons.arrow_forward,
                      ),
                      const Divider(height: 24),
                      _StatRow(
                        label: 'Total Score',
                        value: session.totalScore.toString(),
                        icon: Icons.stars,
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 24),

            // Phase 2 placeholder
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(
                      Icons.track_changes,
                      size: 48,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.3),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Target Visualization',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Coming in Phase 2',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveSession(ArcherySession session) async {
    final arrowCount = int.tryParse(_arrowCountController.text) ?? 0;
    final totalScore = int.tryParse(_scoreController.text) ?? 0;

    final updatedSession = session.copyWith(
      title: _titleController.text.isEmpty ? null : _titleController.text,
      arrowCount: arrowCount,
      totalScore: totalScore,
      averageScore: arrowCount > 0 ? totalScore / arrowCount : null,
      updatedAt: DateTime.now(),
    );

    await ref.read(sessionListProvider.notifier).updateSession(updatedSession);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Session saved')),
      );
      context.go('/');
    }
  }
}

class _StatRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _StatRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
