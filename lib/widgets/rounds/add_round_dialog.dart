import 'package:flutter/material.dart';
import '../../models/target_type.dart';
import '../../widgets/target/target_factory.dart';

class AddRoundDialog extends StatefulWidget {
  const AddRoundDialog({super.key});

  @override
  State<AddRoundDialog> createState() => _AddRoundDialogState();
}

class _AddRoundDialogState extends State<AddRoundDialog> {
  final _formKey = GlobalKey<FormState>();
  
  // Distance presets
  static const List<int> _metricDistances = [18, 25, 30, 50, 60, 70, 90];
  static const List<int> _imperialDistances = [20, 30, 40, 50, 60, 80, 100];
  
  String _distanceUnit = 'm';
  int? _selectedDistance;
  int? _customDistance;
  TargetType _selectedTarget = TargetType.wa10Ring122cm;
  bool _useCustomDistance = false;

  @override
  void initState() {
    super.initState();
    _selectedDistance = _metricDistances[0];
  }

  List<int> get _availableDistances =>
      _distanceUnit == 'm' ? _metricDistances : _imperialDistances;

  void _updateTargetSuggestion() {
    final distance = _useCustomDistance ? _customDistance : _selectedDistance;
    if (distance != null) {
      setState(() {
        _selectedTarget = TargetFactory.suggestTarget(distance, _distanceUnit);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Round'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Distance unit toggle
              Row(
                children: [
                  const Text('Unit: '),
                  const SizedBox(width: 8),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(value: 'm', label: Text('Meters')),
                      ButtonSegment(value: 'yd', label: Text('Yards')),
                    ],
                    selected: {_distanceUnit},
                    onSelectionChanged: (Set<String> newSelection) {
                      setState(() {
                        _distanceUnit = newSelection.first;
                        _selectedDistance = _availableDistances[0];
                        _updateTargetSuggestion();
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Distance selection
              if (!_useCustomDistance) ...[
                const Text('Distance:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _availableDistances.map((distance) {
                    return ChoiceChip(
                      label: Text('$distance$_distanceUnit'),
                      selected: _selectedDistance == distance,
                      onSelected: (selected) {
                        setState(() {
                          _selectedDistance = distance;
                          _updateTargetSuggestion();
                        });
                      },
                    );
                  }).toList(),
                ),
              ],

              // Custom distance toggle
              const SizedBox(height: 8),
              CheckboxListTile(
                title: const Text('Custom distance'),
                value: _useCustomDistance,
                onChanged: (value) {
                  setState(() {
                    _useCustomDistance = value ?? false;
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),

              // Custom distance input
              if (_useCustomDistance) ...[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Distance ($_distanceUnit)',
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a distance';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    final distance = int.tryParse(value);
                    if (distance != null) {
                      _customDistance = distance;
                      _updateTargetSuggestion();
                    }
                  },
                ),
                const SizedBox(height: 16),
              ],

              // Target type selection
              const Text('Target Face:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              DropdownButtonFormField<TargetType>(
                value: _selectedTarget,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: TargetType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.displayName),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedTarget = value;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final distance = _useCustomDistance ? _customDistance : _selectedDistance;
              if (distance != null) {
                Navigator.of(context).pop({
                  'distance': distance,
                  'distanceUnit': _distanceUnit,
                  'targetType': _selectedTarget.name,
                });
              }
            }
          },
          child: const Text('Add Round'),
        ),
      ],
    );
  }
}
