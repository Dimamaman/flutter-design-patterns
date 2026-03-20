import '../command.dart';
import '../counter.dart';

class DecrementCounterCommand implements Command {
  DecrementCounterCommand(this.counter);

  final Counter counter;

  @override
  String getTitle() => 'Decrement counter';

  @override
  void execute() {
    counter.value--;
  }

  @override
  void undo() {
    counter.value++;
  }
}

