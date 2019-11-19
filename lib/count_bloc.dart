import 'dart:async';

import 'bloc.dart';

class CountBLoC implements Bloc {
  int _count = 0;
  int get count => this._count;

  // 1
  final _countController = StreamController<int>();

  // 2
  Stream<int> get countStream => _countController.stream;

  // 3
  void add(int newCount) {
    print(newCount);
    this._count += newCount;
    _countController.sink.add(this._count);
  }

  // 4
  @override
  void dispose() {
    _countController.close();
  }
}
