import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'route_handlers.dart';

class Routes {
  static String root = '/';
  static String detail = '/detail';
  static String homeSimple = '/home/simple';
  static String homeSimpleFixedTrans = '/home/fixedTrans';
  static String homeFunc = '/home/func';
  static String deepLink = 'home/message';

  /// fluro
  static String fluro = 'fluro';

  /// Transition Routers
  static String transition = 'transition';
  static String transitionnative = 'transitionnative';
  static String transitionnativeModal = 'transitionnativeModal';
  static String transitioninFromLeft = 'transitioninFromLeft';
  static String transitioninFromRight = 'transitioninFromRight';
  static String transitioninFromBottom = 'transitioninFromBottom';
  static String transitionfadeIn = 'transitionfadeIn';
  static String transitioncustom = 'transitioncustom';
  static String transitionmaterial = 'transitionmaterial';
  static String transitionmaterialFullScreenDialog = 'transitionmaterialFullScreenDialog';
  static String transitioncupertino = 'transitioncupertino';
  static String transitioncupertinoFullScreenDialog = 'transitioncupertinoFullScreenDialog';

  /// Tutorial
  static String tutorial = 'tutorial';
  static String tutorial1 = 'tutorial/1';
  static String tutorial2 = 'tutorial/2';
  static String tutorial3 = 'tutorial/3';
  static String tutorial4 = 'tutorial/4';
  static String tutorial5 = 'tutorial/5';
  static String tutorial6 = 'tutorial/6';
  static String tutorial7 = 'tutorial/7';
  static String tutorial8 = 'tutorial/8';

  static void configRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('Routes NOT FOUND!!! -->context: ${context.toString()}\nparams: $params');
      return null;
    });

    router.define(root, handler: rootHandler);
    router.define(detail, handler: detailHandler);
    router.define(homeSimple, handler: homeRouteHandler);
    router.define(homeSimpleFixedTrans, handler: homeRouteHandler, transitionType: TransitionType.inFromLeft);
    router.define(homeFunc, handler: homeFuncHandler);

    /// fluro
    router.define(fluro, handler: fluroPageHandler);

    /// Transition All Type Test
    router.define(transition, handler: transitionPageHandler);
    router.define(transitionnative, handler: transitionHandler, transitionType: TransitionType.native);
    router.define(transitionnativeModal, handler: transitionHandler, transitionType: TransitionType.nativeModal);
    router.define(transitioninFromLeft, handler: transitionHandler, transitionType: TransitionType.inFromLeft);
    router.define(transitioninFromRight, handler: transitionHandler, transitionType: TransitionType.inFromRight);
    router.define(transitioninFromBottom, handler: transitionHandler, transitionType: TransitionType.inFromBottom);
    router.define(transitionfadeIn, handler: transitionHandler, transitionType: TransitionType.fadeIn);
    router.define(transitioncustom, handler: transitionHandler, transitionType: TransitionType.custom);
    router.define(transitionmaterial, handler: transitionHandler, transitionType: TransitionType.material);
    router.define(transitionmaterialFullScreenDialog,
        handler: transitionHandler, transitionType: TransitionType.materialFullScreenDialog);
    router.define(transitioncupertino, handler: transitionHandler, transitionType: TransitionType.cupertino);
    router.define(transitioncupertinoFullScreenDialog,
        handler: transitionHandler, transitionType: TransitionType.cupertinoFullScreenDialog);

    /// Turoist
    router.define(tutorial, handler: tutorialHandler);
    router.define(tutorial1, handler: tutorial1Handler);
    router.define(tutorial2, handler: tutorial2Handler);
    router.define(tutorial3, handler: tutorial3Handler);
    router.define(tutorial4, handler: tutorial4Handler);
    router.define(tutorial5, handler: tutorial5Handler);
    router.define(tutorial6, handler: tutorial6Handler);
    router.define(tutorial7, handler: tutorial7Handler);
    router.define(tutorial8, handler: tutorial8Handler);
  }
}
