import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        children: <Widget>[
          ...new List<int>.generate(50, (t) => t + 1).map((t) => Container(
                child: ListTile(
                  title: Text('Main $t'),
                  onTap: () {},
                ),
                // color: Colors.blue,
              )),
        ],
      ),
      drawer: Drawer(
        elevation: 3,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: const Text('Drawer Header'),
              decoration: BoxDecoration(color: Colors.purple),
            ),
            ...new List<int>.generate(50, (t) => t + 1).map((t) => Container(
                  child: ListTile(
                    title: Text('Item $t'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  color: Colors.blue,
                )),
          ],
        ),
      ),
    );
  }
}
