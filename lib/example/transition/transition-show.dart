import 'package:flutter/material.dart';

class TransitionShowPage extends StatelessWidget {
  final String title;
  const TransitionShowPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('$title'),
      ),
    );
  }
}
