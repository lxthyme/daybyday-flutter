import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw/components/Route/route-model.dart';
import 'package:flutter_hw/config/routes.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

final List<RouteModel> routeList = [
  RouteModel(
    name: 'Alert',
    router: Routes.exAlert,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: 'Card',
    router: Routes.exCard,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: 'Drawer',
    router: Routes.exDrawer,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: 'Grid View',
    router: Routes.exGridView,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: 'List Tile',
    router: Routes.exListTile,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: 'List',
    router: Routes.exList,
    transitionType: TransitionType.native,
    callback: () {},
  ),
];

class ExScreen extends StatelessWidget {
  final String title;
  const ExScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          ...routeList.map((t) {
            t.context = context;
            return t;
          }).map((t) => ListTile(
                title: Text(t.name),
                onTap: t.push,
              ))
        ],
      ),
    );
  }
}
