import 'package:flutter/material.dart';

import '../../../design_patterns/command/command.dart';
import '../../../design_patterns/command/command_history.dart';
import '../../../design_patterns/command/counter.dart';
import '../../../design_patterns/command/commands/increment_counter_command.dart';
import '../../../design_patterns/command/commands/decrement_counter_command.dart';

class CounterCommandExample extends StatefulWidget {
  const CounterCommandExample({super.key});

  @override
  State<CounterCommandExample> createState() => _CounterCommandExampleState();
}

class _CounterCommandExampleState extends State<CounterCommandExample> {
  final _counter = Counter();
  final _history = CommandHistory();

  void _run(Command command) {
    setState(() {
      command.execute();
      _history.add(command);
    });
  }

  void _undo() {
    setState(() {
      _history.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Value: ${_counter.value}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _run(IncrementCounterCommand(_counter)),
              child: const Text('+'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _run(DecrementCounterCommand(_counter)),
              child: const Text('-'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: _history.isEmpty ? null : _undo,
              child: const Text('Undo'),
            ),
          ],
        ),
      ],
    );
  }
}

