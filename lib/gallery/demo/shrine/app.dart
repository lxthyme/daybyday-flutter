import 'package:flutter/material.dart';

class ShrineApp extends StatefulWidget {
  ShrineApp({Key key}) : super(key: key);

  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 450),
      value: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: const Text('HomePage'),
    );
  }
}
