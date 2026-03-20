import '../command.dart';
import '../counter.dart';

class IncrementCounterCommand implements Command {
  IncrementCounterCommand(this.counter);

  final Counter counter;

  @override
  String getTitle() => 'Increment counter';

  @override
  void execute() {
    counter.value++;
  }

  @override
  void undo() {
    counter.value--;
  }
}

