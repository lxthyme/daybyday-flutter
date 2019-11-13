import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class RouteArgumentsScreen extends StatelessWidget {
  final String title;
  const RouteArgumentsScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Router Query',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Flutter Router Query')
      //   ),
      //   body: Center(
      //     child: Text('Hello World!'),
      //   )
      // ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      },
      // home: Scaffold(
      //   appBar: AppBar(title: Text(title)),
      //   body: Center(
      //     child: Text('Hello World!'),
      //   ),
      // ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Navigate to screen with extracts arguments'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              ExtractArgumentsScreen.routeName,
              arguments: ScreenArguments('Extract Arguments Screen', 'This message is extracted in the build method'),
            );
          },
        ),
      ),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}
