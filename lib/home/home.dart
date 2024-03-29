import 'package:flutter/material.dart';
import 'package:flutter_hw/components/Route/route-model.dart';
import 'package:flutter_hw/config/routes.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

final List<RouteModel> routeList = [
  RouteModel(
    name: 'Fluro',
    router: Routes.fluro,
  ),
  RouteModel(
    name: 'Transition',
    router: Routes.transition,
  ),
  RouteModel(
    name: 'Tutorial',
    router: Routes.tutorial,
  ),
  RouteModel(
    name: 'Ex',
    router: Routes.ex,
  ),
  RouteModel(
    name: 'Material',
    router: Routes.material,
  ),
  RouteModel(
    name: 'Gallery',
    router: Routes.gallery,
  ),
  RouteModel(
    name: 'Gallery test',
    router: Routes.galleryTest,
  ),
];

class HomeComponent extends StatelessWidget {
  final String title;

  const HomeComponent({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(padding: const EdgeInsets.all(16), children: <Widget>[
        // ...List<int>.generate(100, (t) => t + 1).map((t) => ListTile(
        //   title: Text('Item $t'),
        //   onTap: () {
        //     Application.router.navigateTo(context, '/detail?id=$t', transition: TransitionType.cupertino).then((result) {
        //       print('R: $result');
        //     });
        //   },
        // )),
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
      ]),
    );
  }
}
