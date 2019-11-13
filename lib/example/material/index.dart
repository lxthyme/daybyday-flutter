import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw/components/Route/route-model.dart';
import 'package:flutter_hw/config/routes.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

final List<RouteModel> routeList = [
  RouteModel(
    name: 'Backdrop',
    router: Routes.mBackdrop,
    transitionType: TransitionType.native,
    callback: () {},
  ),
];

class MaterialScreen extends StatelessWidget {
  final String title;
  const MaterialScreen({Key key, this.title}) : super(key: key);

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
