
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hw/config/application.dart';

class RouteModel {
  BuildContext context;
  final String name;
  final String router;
  final TransitionType transitionType;
  final VoidCallback callback;

  RouteModel({this.context, this.name, this.router, this.transitionType = TransitionType.inFromLeft, this.callback});

  void push() {
    Application.router.navigateTo(context, '${this.router}?title=${this.name}', transition: this.transitionType).then((result) {
      print('Result[$router]: $result');
    });
  }

}
