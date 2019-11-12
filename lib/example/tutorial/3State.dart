import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Counter',
//     home: CounterScreen()
//   ));
// }

class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment'),
    );
  }
}

class CounterScreen extends StatefulWidget {
  final String title;

  const CounterScreen({Key key, this.title}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<CounterScreen> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              RaisedButton(
                onPressed: _increment,
                child: Text('${widget.title} Increment'),
              ),
              Text('Count: $_counter'),
              Text('eg: '),
              CounterIncrementor(onPressed: _increment),
              CounterDisplay(count: _counter),
            ],
          )
        ],
      ),
    );
  }
}
