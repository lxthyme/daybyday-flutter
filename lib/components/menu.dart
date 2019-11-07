import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw/config/application.dart';

Widget MenuButton(BuildContext context, String assetSrc, String title, String key) {
  return Padding(
    padding: const EdgeInsets.all(4),
    child: Container(
      height: 42,
      child: FlatButton(
        color: const Color(0x22ffffff),
        highlightColor: const Color(0x11ffffff),
        splashColor: const Color(0x22ffffff),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 36,
                child: Image.asset(
                  assetSrc,
                  fit: BoxFit.contain
                ),
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xaa001133),
              ),
            ),
          ],
        ),
        onPressed: () {
          tappedMenuButton(context, key);
        },
      ),
    ),
  );
}

void tappedMenuButton(BuildContext context, String key) {
  String msg = '';
  String hexCode = '#fff';
  String result;
  String _route = '';
  TransitionType transitionType = TransitionType.native;

  final _daysOfWeek = const [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  if(key != 'custom' && key != 'function-call' && key != 'fixed-trans') {
    if(key == 'native') {
      hexCode = '#f76f00';
      msg = 'This screen should have appeared using the default flutter animation for the current OS';
    } else if(key == 'preset-from-left') {
      hexCode = '#5bf700';
      msg = 'This screen should have appeared with a slide in from left transition';
      transitionType = TransitionType.inFromLeft;
    } else if(key == 'preset-fade') {
      _route = 'home/simple';
      hexCode = '#f700d2';
      msg = 'This screen should have appeared with a fade in transition';
      transitionType = TransitionType.fadeIn;
    } else if(key == 'pop-result') {
      hexCode = '#7d41f4';
      msg = 'When you close this screen you should see the current day of the week';
      transitionType = TransitionType.native;
      result = 'Today is ${_daysOfWeek[DateTime.now().weekday - 1]}!';
    }

    String route = '/home/simple?message=$msg&color_hex=$hexCode';
    // if(_route.length > 0) {
    //   route = '$_route?message=$msg&color_hex=$hexCode';
    // }

    if(result != null) {
      route = '$route&result=$result';
    }

    print('Route: $route');

    Application.router.navigateTo(
      context,
      route,
      transition: transitionType
    ).then((r) {
      if(key == 'pop-result') {
        Application.router.navigateTo(context, '/home/func?message=$result');
      }
    });
  } else if(key == 'custom') {
    hexCode = '#dff700';
    msg = 'This screen should have appeared with a crazy custom transition';
    var transition = (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return ScaleTransition(
        scale: animation,
        child: RotationTransition(
          turns: animation,
          child: child,
        ),
      );
    };

    Application.router.navigateTo(
      context,
      '/home/simple?message=$msg&color_hex=$hexCode',
      transition: TransitionType.custom,
      transitionBuilder: transition,
      transitionDuration: const Duration(milliseconds: 600),
    );
  } else if(key == 'fixed-trans') {
    Application.router.navigateTo(
      context,
      '/home/simple?message=Hello!&color_hex=#f4424b',
    );
  } else {
    msg = 'You tapped the function button!';
    Application.router.navigateTo(
      context,
      '/home/func?message=$msg',
    );
  }
}
