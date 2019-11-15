import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hw/config/application.dart';
import 'package:flutter_hw/config/routes.dart';

class RouteModel {
  BuildContext context;
  final String name;
  final String router;
  final TransitionType transitionType;
  final VoidCallback callback;

  RouteModel({this.context, this.name, this.router, this.transitionType = TransitionType.cupertino, this.callback});

  void push() {
    if (Application.router == null) {
      final router = Router();
      Routes.configRoutes(router);
      Application.router = router;
    }
    Application.router
        .navigateTo(context, '${this.router}?title=${this.name}', transition: this.transitionType)
        .then((result) {
      print('Result[$router]: $result');
    });
  }
}
