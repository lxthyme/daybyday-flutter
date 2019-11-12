import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw/components/Route/route-model.dart';
import 'package:flutter_hw/config/routes.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

final List<RouteModel> routeList = [
  RouteModel(
    name: 'native',
    router: Routes.transitionnative,
    transitionType: TransitionType.native,
    callback: () {},
  ),
];

class TutorialScreen extends StatelessWidget {
  final String title;
  const TutorialScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
