import 'package:flutter/material.dart';
import 'bloc_provider.dart';
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
        bloc: CountBLoC(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CountBLoC bloc = BlocProvider.of<CountBLoC>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(
        child: StreamBuilder<int>(
            stream: bloc.countStream,
            initialData: bloc.count,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              print(snapshot.data);
              return Text('You hit me: ${snapshot.data} times');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          bloc.add(1);
        },
      ),
    );
  }
}
