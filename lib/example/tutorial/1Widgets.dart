import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     Center(child: Text(
//       'Hello world!',
//       textDirection: TextDirection.ltr
//     ),
//     )
//   );
// }

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title1, this.title2});

  final Widget title1;
  final Widget title2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(
            child: title1,
          ),
          Expanded(
            child: title2,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class Tutorial1Screen extends StatelessWidget {
  final String title;
  const Tutorial1Screen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: <Widget>[
          MyAppBar(
            title1:
                Text('title1', style: Theme.of(context).primaryTextTheme.title),
            title2:
                Text('title2', style: Theme.of(context).primaryTextTheme.title),
          ),
          Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          )
        ],
      ),
    );
  }
}
