import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hw/example/fluro/detail.dart';
import 'package:flutter_hw/example/fluro/home_simple.dart';
import 'package:flutter_hw/example/fluro/index.dart';
import 'package:flutter_hw/example/transition/transition-show.dart';
import 'package:flutter_hw/example/transition/transition.dart';
import 'package:flutter_hw/example/tutorial/1Widgets.dart';
import 'package:flutter_hw/example/tutorial/2Material.dart';
import 'package:flutter_hw/example/tutorial/3State.dart';
import 'package:flutter_hw/example/tutorial/4ShopingList.dart';
import 'package:flutter_hw/example/tutorial/ShoppingList.dart' as prefix0;
import 'package:flutter_hw/example/tutorial/ShoppingList.dart';
import 'package:flutter_hw/example/tutorial/index.dart';
import 'package:flutter_hw/example/tutorial/main.dart';
import 'package:flutter_hw/example/tutorial/main2.dart';
import 'package:flutter_hw/example/tutorial/main3.dart';
import 'package:flutter_hw/helpers/color_helpers.dart';
import 'package:flutter_hw/home/home.dart';

var rootHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeComponent();
});

var detailHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DetailPage();
});

var homeRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String msg = params['message']?.first;
    String colorHex = params['color_hex']?.first;
    String result = params['result']?.first;
    Color color = Color(0xffffffff);
    if (colorHex != null && colorHex.length > 0) {
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
    if (colorHex != null && colorHex.length > 0) {
      color = Color(ColorHelpers.fromHexString(colorHex));
    }
    return HomeSimpleComponent('Deep Link!!!', color, result);
  },
);

var fluroPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('params: $params');
    var name = params['title']?.first ?? '';
    return FluroPage(
      title: name,
    );
  },
);

var transitionPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('params: $params');
    var name = params['title']?.first ?? '';
    return TransitionPage(
      title: name,
    );
  },
);

var transitionHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('params: $params');
    var name = params['title']?.first ?? '';
    return TransitionShowPage(
      title: name,
    );
  },
);

var tutorialHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    print('context: $context');
    print('params: $params');
    var name = params['title']?.first ?? '';
    return TutorialScreen(title: name);
  },
);

var tutorial1Handler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return Tutorial1Screen(title: name);
  },
);
var tutorial2Handler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return Tutorial2Screen(title: name);
  },
);
var tutorial3Handler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return CounterScreen(title: name);
  },
);
var tutorial4Handler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return Tutorial4Screen(title: name);
  },
);
var tutorial5Handler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return Tutorial5Screen(title: name);
  },
);
var tutorial6Handler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return MyHomeScreen(title: name);
  },
);
var tutorial7Handler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return RandomWordsScreen(title: name);
  },
);
var tutorial8Handler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    var productList = List<int>.generate(20, (t) => t + 1).map((t) => prefix0.Product(name: "Name $t"));
    return ShoppingListScreen(
      title: name,
      products: productList.toList(),
    );
  },
);
