import 'package:flutter/material.dart';
import 'package:flutter_hw/home/home.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main(List<String> args) {
  debugPaintSizeEnabled = true;

  runApp(MaterialApp(
    home: HomeComponent(
      title: 'Home Page',
    ),
  ));
}

// void main() {
//   runApp(GalleryApp());
// }
