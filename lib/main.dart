import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'count_bloc.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Streams Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        builder: (context) => CounterBLoC(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Builder version of the Counter App')),
      body: BlocBuilder<CounterBLoC, int>(builder: (context, count) {
        return CountWidget(
          count: count,
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            BlocProvider.of<CounterBLoC>(context).add(CounterEvent.increment),
      ),
    );
  }
}

class CountWidget extends StatelessWidget {
  final int count;

  CountWidget({this.count});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'You Hit ${this.count}',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
