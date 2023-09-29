import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nuntium_rigid/core/core.dart';
import 'package:nuntium_rigid/injectable.dart';
import 'package:rxdart/rxdart.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late CounterController counterController;
  late Stream<StreamState<int>> counterStream;

  @override
  void initState() {
    counterController = getIt<CounterController>();
    counterStream = counterController.counterStream.asStreamState();
    super.initState();
  }

  @override
  void dispose() {
    counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.incrementCounter();
        },
      ),
      body: Center(
        child: counterStream.buildWhen(
          loading: () => const SizedBox(),
          success: (value) => Text("$value"),
        ),
      ),
    );
  }
}

@lazySingleton
class CounterController {
  final Sink<int> _counterSink;
  final Stream<int> counterStream;
  final BehaviorSubject<int> subject;

  CounterController._({
    required Sink<int> counterSink,
    required this.counterStream,
    required this.subject,
  }) : _counterSink = counterSink;

  factory CounterController() {
    final subject = BehaviorSubject<int>.seeded(0);
    final counterStream = subject.distinct();
    return CounterController._(
      counterSink: subject,
      counterStream: counterStream,
      subject: subject,
    );
  }

  void incrementCounter() {
    _counterSink.add(subject.value + 1);
  }

  void decrementCounter() {
    _counterSink.add(subject.value - 1);
  }

  void dispose() {
    _counterSink.close();
  }
}
