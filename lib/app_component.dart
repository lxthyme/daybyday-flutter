import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'config/application.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'config/routes.dart';

class AppComponent extends StatefulWidget {
  AppComponent({Key key}) : super(key: key);

  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {

  _AppComponentState() {
    final router = Router();
    Routes.configRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: 'Flutter Main',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}
