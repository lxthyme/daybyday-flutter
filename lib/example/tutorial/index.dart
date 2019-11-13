import 'package:flutter/material.dart';
import 'package:flutter_hw/components/Route/route-model.dart';
import 'package:flutter_hw/config/routes.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

final List<RouteModel> routeList = [
  RouteModel(
    name: '1Widgets',
    router: Routes.tutorial1,
    callback: () {},
  ),
  RouteModel(
    name: '2Material',
    router: Routes.tutorial2,
    callback: () {},
  ),
  RouteModel(
    name: '3State',
    router: Routes.tutorial3,
    callback: () {},
  ),
  RouteModel(
    name: '4ShopingList',
    router: Routes.tutorial4,
    callback: () {},
  ),
  RouteModel(
    name: 'main',
    router: Routes.tutorial5,
    callback: () {},
  ),
  RouteModel(
    name: 'main2',
    router: Routes.tutorial6,
    callback: () {},
  ),
  RouteModel(
    name: 'main3',
    router: Routes.tutorial7,
    callback: () {},
  ),
  RouteModel(
    name: 'ShoppingList',
    router: Routes.tutorial8,
    callback: () {},
  ),
  RouteModel(
    name: 'Flutter Layout Demo',
    router: Routes.tutorialD5,
    callback: () {},
  ),
  RouteModel(
    name: 'First Route',
    router: Routes.tutorialD6,
    callback: () {},
  ),
  RouteModel(
    name: 'Transition Demo',
    router: Routes.tutorialD7,
    callback: () {},
  ),
  RouteModel(
    name: 'Router Name Demo',
    router: Routes.tutorialD8,
    callback: () {},
  ),
  RouteModel(
    name: 'Router Query',
    router: Routes.tutorialD9,
    callback: () {},
  ),
  RouteModel(
    name: 'Navigation with Arguments',
    router: Routes.tutorialD10,
    callback: () {},
  ),
  RouteModel(
    name: 'App Component',
    router: Routes.tutorialD11AppComponent,
    callback: () {},
  ),
  RouteModel(
    name: 'Test',
    router: Routes.tutorialD12Test,
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
          }).map(
            (t) => Card(
                child: ListTile(
              title: Text(t.name),
              onTap: t.push,
            )),
          )
        ],
      ),
    );
  }
}
