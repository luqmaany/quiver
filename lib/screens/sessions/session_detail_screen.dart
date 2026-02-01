import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../providers/session_provider.dart';
import '../../models/archery_round.dart';
import '../../widgets/rounds/round_list.dart';

class SessionDetailScreen extends ConsumerStatefulWidget {
  final String sessionId;

  const SessionDetailScreen({super.key, required this.sessionId});

  @override
  ConsumerState<SessionDetailScreen> createState() =>
      _SessionDetailScreenState();
}

class _SessionDetailScreenState extends ConsumerState<SessionDetailScreen> {
  late TextEditingController _titleController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _selectDateTime(BuildContext context, DateTime currentDate) async {
    final date = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      if (!mounted) return;
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(currentDate),
      );

      if (time != null && mounted) {
        setState(() {
          _selectedDate = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
        _saveSessionMetadata();
      }
    }
  }

  Future<void> _saveSessionMetadata() async {
    final session = ref.read(sessionProvider(widget.sessionId));
    if (session == null) return;

    final updatedSession = session.copyWith(
      title: _titleController.text.isEmpty ? null : _titleController.text,
      date: _selectedDate ?? session.date,
      updatedAt: DateTime.now(),
    );

    await ref.read(sessionListProvider.notifier).updateSession(updatedSession);
  }

  void _handleRoundAdded(ArcheryRound round) {
    ref.read(sessionListProvider.notifier).addRound(widget.sessionId, round);
  }

  void _handleRoundDeleted(String roundId) {
    ref.read(sessionListProvider.notifier).deleteRound(
          widget.sessionId,
          roundId,
        );
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
    }
    _selectedDate ??= session.date;

    final dateFormat = DateFormat('EEEE, MMM dd, yyyy • HH:mm');
    final displayDate = _selectedDate ?? session.date;

    // Calculate aggregate stats from rounds
    final totalArrows = session.rounds.fold(0, (sum, r) => sum + r.arrowCount);
    final totalScore = session.rounds.fold(0, (sum, r) => sum + r.totalScore);
    final averageScore = totalArrows > 0 ? totalScore / totalArrows : 0.0;

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
            onPressed: _saveSessionMetadata,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Session metadata
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date display
                  InkWell(
                    onTap: () => _selectDateTime(context, displayDate),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
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
                              dateFormat.format(displayDate),
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            ),
                          ),
                          Icon(
                            Icons.edit,
                            size: 20,
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title field
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Session Title',
                      hintText: 'e.g., Morning Practice',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.title),
                    ),
                    onChanged: (_) => _saveSessionMetadata(),
                  ),
                ],
              ),
            ),

            // Session aggregate stats
            if (session.rounds.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Session Totals',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 12),
                        _StatRow(
                          label: 'Total Rounds',
                          value: session.rounds.length.toString(),
                          icon: Icons.track_changes,
                        ),
                        const Divider(height: 24),
                        _StatRow(
                          label: 'Total Arrows',
                          value: totalArrows.toString(),
                          icon: Icons.arrow_forward,
                        ),
                        const Divider(height: 24),
                        _StatRow(
                          label: 'Total Score',
                          value: totalScore.toString(),
                          icon: Icons.stars,
                        ),
                        if (totalArrows > 0) ...[
                          const Divider(height: 24),
                          _StatRow(
                            label: 'Average Score',
                            value: averageScore.toStringAsFixed(2),
                            icon: Icons.show_chart,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 16),

            // Rounds section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Rounds',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 8),

            // Round list
            RoundList(
              sessionId: widget.sessionId,
              rounds: session.rounds,
              onRoundAdded: _handleRoundAdded,
              onRoundDeleted: _handleRoundDeleted,
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
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
