import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hw/example/ex/alert.dart';
import 'package:flutter_hw/example/ex/card.dart';
import 'package:flutter_hw/example/ex/drawer.dart';
import 'package:flutter_hw/example/ex/grid-view.dart';
import 'package:flutter_hw/example/ex/index.dart';
import 'package:flutter_hw/example/ex/list-tile.dart';
import 'package:flutter_hw/example/ex/list.dart';
import 'package:flutter_hw/example/fluro/detail.dart';
import 'package:flutter_hw/example/fluro/home_simple.dart';
import 'package:flutter_hw/example/fluro/index.dart';
import 'package:flutter_hw/example/gallery-test/index.dart';
import 'package:flutter_hw/example/gallery-test/stack.dart';
import 'package:flutter_hw/example/material/backdrop_demo.dart';
import 'package:flutter_hw/example/material/bottom-bar.dart';
import 'package:flutter_hw/example/material/index.dart';
import 'package:flutter_hw/example/transition/transition-show.dart';
import 'package:flutter_hw/example/transition/transition.dart';
import 'package:flutter_hw/example/tutorial/10.main.dart';
import 'package:flutter_hw/example/tutorial/1Widgets.dart';
import 'package:flutter_hw/example/tutorial/2Material.dart';
import 'package:flutter_hw/example/tutorial/3State.dart';
import 'package:flutter_hw/example/tutorial/4ShopingList.dart';
import 'package:flutter_hw/example/tutorial/5.dart';
import 'package:flutter_hw/example/tutorial/6.Router.dart';
import 'package:flutter_hw/example/tutorial/7.router-animation.dart';
import 'package:flutter_hw/example/tutorial/8.router-name.dart';
import 'package:flutter_hw/example/tutorial/9.route-arguments.dart';
import 'package:flutter_hw/example/tutorial/ShoppingList.dart' as prefix0;
import 'package:flutter_hw/example/tutorial/ShoppingList.dart';
import 'package:flutter_hw/example/tutorial/app_component.dart';
import 'package:flutter_hw/example/tutorial/index.dart';
import 'package:flutter_hw/example/tutorial/main.dart';
import 'package:flutter_hw/example/tutorial/main2.dart';
import 'package:flutter_hw/example/tutorial/main3.dart';
import 'package:flutter_hw/example/tutorial/test.dart';
import 'package:flutter_hw/gallery/app.dart';
import 'package:flutter_hw/helpers/color_helpers.dart';
import 'package:flutter_hw/home/home.dart';

var rootHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeComponent(
    title: 'Home Page',
  );
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
var tutorialLayourHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return LayourScreen(title: name);
  },
);
var tutorialFirstRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return FirstRouteScreen(title: name);
  },
);
var tutorialHeroHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return HeroScreen(title: name);
  },
);
var tutorialRouteNameHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return RouteNameScreen(title: name);
  },
);
var tutorialouteArgumentsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return RouteArgumentsScreen(title: name);
  },
);
var tutorialMaterialPageRouteHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return MaterialPageRouteScreen(title: name);
  },
);
var tutorialAppComponentHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return AppComponentScreen(title: name);
  },
);
var tutorialTestHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return TestScreen(title: name);
  },
);

/// ex
var exHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return ExScreen(title: name);
  },
);
var exAlertHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return DialogDemo(title: name);
  },
);
var exCardHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return CardScreen(title: name);
  },
);
var exDrawerHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return MainScreen(title: name);
  },
);
var exGridViewHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return GridViewScreen(title: name);
  },
);
var exListTileHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return ListTileScreen(title: name);
  },
);
var exListHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return ListScreen(title: name);
  },
);

/// material
var materialHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return MaterialScreen(title: name);
  },
);
var mBackdropHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return BackdropScreen(title: name);
  },
);
var mBottomBarHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return BottomBarScreen(title: name);
  },
);

/// Gallery
var mGalleryHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return GalleryApp(title: name);
  },
);

/// Gallery test
var galleryTestHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return GalleryTestScreen(title: name);
  },
);
var gStackHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    var name = params['title']?.first ?? '';
    return StackScreen(title: name);
  },
);
