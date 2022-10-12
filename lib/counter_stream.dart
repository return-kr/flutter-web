import 'dart:async';

class CounterStream {
  final _counterController = StreamController<int>.broadcast();
  StreamSink<int> get counterSink => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;

  void dispose() {
    _counterController.close();
  }
}