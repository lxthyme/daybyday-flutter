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
  static String tutorialD5 = 'tutorial/5';
  static String tutorialD6 = 'tutorial/6';
  static String tutorialD7 = 'tutorial/7';
  static String tutorialD8 = 'tutorial/8';
  static String tutorialD9 = 'tutorial/9';
  static String tutorialD10 = 'tutorial/10';
  static String tutorialD11AppComponent = 'tutorial/d11_app_component';
  static String tutorialD12Test = 'tutorial/d12_test';

  /// ex
  static String ex = "ex_index";
  static String exAlert = "ex_alert";
  static String exCard = "ex_card";
  static String exDrawer = "ex_drawer";
  static String exGridView = "ex_grid-view";
  static String exListTile = "ex_list-tile";
  static String exList = "ex_list";

  /// material
  static String material = "material";
  static String mBackdrop = "m_backdrop";
  static String mBottombar = "m_bottom-bar";

  static void configRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('Routes NOT FOUND!!!\n-->context: ${context.toString()}\n-->params: $params');
      return null;
    });

    router.define(detail, handler: detailHandler);
    router.define(homeSimple, handler: homeRouteHandler);
    router.define(homeSimpleFixedTrans, handler: homeRouteHandler, transitionType: TransitionType.inFromLeft);
    router.define(homeFunc, handler: homeFuncHandler);

    /// root
    router.define(root, handler: rootHandler);

    /// fluro
    router.define(fluro, handler: fluroPageHandler, transitionType: TransitionType.cupertino);

    /// Transition All Type Test
    router.define(transition, handler: transitionPageHandler, transitionType: TransitionType.cupertino);
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
    router.define(tutorial, handler: tutorialHandler, transitionType: TransitionType.cupertino);
    router.define(tutorial1, handler: tutorial1Handler);
    router.define(tutorial2, handler: tutorial2Handler);
    router.define(tutorial3, handler: tutorial3Handler);
    router.define(tutorial4, handler: tutorial4Handler);
    router.define(tutorial5, handler: tutorial5Handler);
    router.define(tutorial6, handler: tutorial6Handler);
    router.define(tutorial7, handler: tutorial7Handler);
    router.define(tutorial8, handler: tutorial8Handler);
    router.define(tutorialD5, handler: tutorialLayourHandler);
    router.define(tutorialD6, handler: tutorialFirstRouteHandler);
    router.define(tutorialD7, handler: tutorialHeroHandler);
    router.define(tutorialD8, handler: tutorialRouteNameHandler);
    router.define(tutorialD9, handler: tutorialouteArgumentsHandler);
    router.define(tutorialD10, handler: tutorialMaterialPageRouteHandler);
    router.define(tutorialD11AppComponent, handler: tutorialAppComponentHandler);
    router.define(tutorialD12Test, handler: tutorialTestHandler);

    /// ex
    router.define(ex, handler: exHandler, transitionType: TransitionType.cupertino);
    router.define(exAlert, handler: exAlertHandler);
    router.define(exCard, handler: exCardHandler);
    router.define(exDrawer, handler: exDrawerHandler);
    router.define(exGridView, handler: exGridViewHandler);
    router.define(exListTile, handler: exListTileHandler);
    router.define(exList, handler: exListHandler);

    /// material
    router.define(material, handler: materialHandler, transitionType: TransitionType.cupertino);
    router.define(mBottombar, handler: mBottomBarHandler);
    router.define(mBackdrop, handler: mBackdropHandler);
  }
}
