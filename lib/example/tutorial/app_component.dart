import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw/config/application.dart';
import 'package:flutter_hw/config/routes.dart';

class AppComponentScreen extends StatefulWidget {
  final String title;

  AppComponentScreen({Key key, @required this.title}) : super(key: key);

  @override
  _AppComponentScreenState createState() => _AppComponentScreenState();
}

class _AppComponentScreenState extends State<AppComponentScreen> {
  _AppComponentScreenState() {
    if (Application.router == null) {
      final router = Router();
      Routes.configRoutes(router);
      Application.router = router;
      print('>>>??Application.router: ${Application.router}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: widget.title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Application.router.generator,
    );
    return app;
  }
}
