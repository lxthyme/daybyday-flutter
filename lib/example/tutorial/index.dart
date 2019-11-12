import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw/components/Route/route-model.dart';
import 'package:flutter_hw/config/routes.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

final List<RouteModel> routeList = [
  RouteModel(
    name: '1Widgets',
    router: Routes.tutorial1,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: '2Material',
    router: Routes.tutorial2,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: '3State',
    router: Routes.tutorial3,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: '4ShopingList',
    router: Routes.tutorial4,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: 'main',
    router: Routes.tutorial5,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: 'main2',
    router: Routes.tutorial6,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: 'main3',
    router: Routes.tutorial7,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: 'ShoppingList',
    router: Routes.tutorial8,
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
