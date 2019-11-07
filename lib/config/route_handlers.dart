import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hw/example/fluro/detail.dart';
import 'package:flutter_hw/example/fluro/home_simple.dart';
import 'package:flutter_hw/example/fluro/index.dart';
import 'package:flutter_hw/example/transition/transition-show.dart';
import 'package:flutter_hw/example/transition/transition.dart';
import 'package:flutter_hw/helpers/color_helpers.dart';
import 'package:flutter_hw/home/home.dart';

var rootHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomeComponent();
  }
);

var detailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return DetailPage();
  }
);

var homeRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String msg = params['message']?.first;
    String colorHex = params['color_hex']?.first;
    String result = params['result']?.first;
    Color color = Color(0xffffffff);
    if(colorHex != null && colorHex.length > 0) {
      color = Color(ColorHelpers.fromHexString(colorHex));
    }
    return HomeSimpleComponent(msg, color, result);
  },
);

var homeFuncHandler = Handler(
  type: HandlerType.function,
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String msg = params['message']?.first;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Hey Hey!',
            style: TextStyle(
              color: const Color(0xff00d6f7),
              fontFamily: 'Lazer84',
              fontSize: 22,
            ),
          ),
          content: Text('$msg'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8, right: 8),
              child: FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ),
          ],
        );
      },
    );
  },
);

/// fluro://deeplink?path=/message&mesage=fluro rocks!!
var deepLinkHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String colorHex = params['color_hex']?.first;
    String result = params['result']?.first;
    Color color = Color(0xffffffff);
    if(colorHex != null && colorHex.length > 0) {
      color = Color(ColorHelpers.fromHexString(colorHex));
    }
    return HomeSimpleComponent('Deep Link!!!', color, result);
  },
);

var fluroPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('params: $params');
    var name = params['title']?.first ?? '';
    return FluroPage(title: name,);
  },
);

var transitionPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('params: $params');
    var name = params['title']?.first ?? '';
    return TransitionPage(title: name,);
  },
);

var transitionHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('params: $params');
    var name = params['title']?.first ?? '';
    return TransitionShowPage(title: name,);
  },
);
