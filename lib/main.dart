import 'package:flutter/material.dart';
import 'package:flutter_hw/home/home.dart';

// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() {
// // debugPaintSizeEnabled = true;

// runApp(MaterialApp(
//   title: 'Flutter Example',
//   home: Scaffold(
//     appBar: AppBar(
//       title: Text('Flutter Main')
//     ),
//     body: Center(
//       child: Text('Hello World!'),
//     )
//   ),
// ));
// }

void main(List<String> args) {
  runApp(HomeComponent(title: 'Home Page',));
}
