import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw/components/Route/route-model.dart';
import 'package:flutter_hw/config/routes.dart';

final List<RouteModel> routeList = [
  RouteModel(
    name: 'native',
    router: Routes.transitionnative,
    transitionType: TransitionType.native,
    callback: () {},
  ),
  RouteModel(
    name: 'nativeModal',
    router: Routes.transitionnativeModal,
    transitionType: TransitionType.nativeModal,
    callback: () {},
  ),
  RouteModel(
    name: 'inFromLeft',
    router: Routes.transitioninFromLeft,
    transitionType: TransitionType.inFromLeft,
    callback: () {},
  ),
  RouteModel(
    name: Routes.transitioninFromRight,
    router: 'transitioninFromRight',
    transitionType: TransitionType.inFromRight,
    callback: () {},
  ),
  RouteModel(
    name: Routes.transitioninFromBottom,
    router: 'transitioninFromBottom',
    transitionType: TransitionType.inFromBottom,
    callback: () {},
  ),
  RouteModel(
    name: 'fadeIn',
    router: Routes.transitionfadeIn,
    transitionType: TransitionType.fadeIn,
    callback: () {},
  ),
  RouteModel(
    name: 'custom',
    router: Routes.transitioncustom,
    transitionType: TransitionType.custom,
    callback: () {},
  ),
  RouteModel(
    name: 'material',
    router: Routes.transitionmaterial,
    transitionType: TransitionType.material,
    callback: () {},
  ),
  RouteModel(
    name: 'materialFullScreenDialog',
    router: Routes.transitionmaterialFullScreenDialog,
    transitionType: TransitionType.materialFullScreenDialog,
    callback: () {},
  ),
  RouteModel(
    name: 'cupertino',
    router: Routes.transitioncupertino,
    transitionType: TransitionType.cupertino,
    callback: () {},
  ),
  RouteModel(
    name: 'cupertinoFullScreenDialog',
    router: Routes.transitioncupertinoFullScreenDialog,
    transitionType: TransitionType.cupertinoFullScreenDialog,
    callback: () {},
  ),
];

class TransitionPage extends StatelessWidget {
  final String title;
  const TransitionPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: ListView(
        children: <Widget>[
          ...routeList.map((t) {
            t.context = context;
            return t;
          }).map((t) => ListTile(
            title: Text('Transition ${t.name}'),
            onTap: t.push,
          )),
        ],
      ),
    );
  }
}
