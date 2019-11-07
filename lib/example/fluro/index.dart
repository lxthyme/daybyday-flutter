import 'package:flutter/material.dart';
import 'package:flutter_hw/components/menu.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class FluroPage extends StatelessWidget {
  final String title;

  const FluroPage({Key key, this.title}) : super(key: key);

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
        title: Text('$title')
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
        ]
      ),
    );
  }
}
