import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hw/home/home.dart';

var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomeComponent();
  }
);
