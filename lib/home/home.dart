import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw/components/Route/route-model.dart';
import 'package:flutter_hw/components/menu.dart';
import 'package:flutter_hw/config/application.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

final List<RouteModel> routeList = [
  RouteModel(
    name: 'Transition',
    router: 'transition',
    callback: () {
      // Application.router.navigateTo(context, '/transition', transition: TransitionType.cupertino).then((result) {
      //   print('R: $result');
      // });
    }
  )
];

class HomeComponent extends StatelessWidget {
  const HomeComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var menuWidgets = <Widget>[
      MenuButton(context, 'assets/images/ic_transform_native_hz.png',
          "Native Animation", "native"),
      MenuButton(context, 'assets/images/ic_transform_fade_in_hz.png',
          "Preset (Fade In)", "preset-fade"),
      MenuButton(context, 'assets/images/ic_transform_global_hz.png',
          "Preset (Global transition)", "fixed-trans"),
      MenuButton(context, 'assets/images/ic_transform_custom_hz.png',
          "Custom Transition", "custom"),
      MenuButton(context, 'assets/images/ic_result_hz.png', "Navigator Result",
          "pop-result"),
      MenuButton(context, 'assets/images/ic_function_hz.png', "Function Call",
          "function-call"),
    ];

    final size = MediaQuery.of(context).size;
    final ratio = size.width / size.height * 2.5;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page')
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: ratio,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            children: menuWidgets,
          ),
          // ...List<int>.generate(100, (t) => t + 1).map((t) => ListTile(
          //   title: Text('Item $t'),
          //   onTap: () {
          //     Application.router.navigateTo(context, '/detail?id=$t', transition: TransitionType.cupertino).then((result) {
          //       print('R: $result');
          //     });
          //   },
          // )),
          ...routeList.map((t) => ListTile(
            title: Text(t.name),
            onTap: () {
              Application.router.navigateTo(context, '/${t.router}?id=$t', transition: TransitionType.cupertino).then((result) {
                print('R: $result');
              });
            },
          ))
        ]
      ),
    );
  }
}
