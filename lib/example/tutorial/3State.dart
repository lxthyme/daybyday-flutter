import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Counter',
    home: Counter()
  ));
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({ this.count });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({ this.onPressed });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(children: <Widget>[
          RaisedButton(
            onPressed: _increment,
            child: Text('Increment'),
          ),
          Text('Count: $_counter'),
          Text('eg: '),
          CounterIncrementor(onPressed: _increment),
          CounterDisplay(count: _counter),
        ],
        )
      ],
    );
  }
}
