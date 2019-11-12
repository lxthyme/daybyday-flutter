import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class GridViewScreen extends StatelessWidget {
  final String title;

  const GridViewScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('GridView')),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 2,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
          children: <Widget>[
            ...new List<int>.generate(100000, (t) => t + 1).map((t) => Container(
                  padding: const EdgeInsets.all(1),
                  color: Colors.teal[50 * t],
                  child: Center(
                    child: Text('Item $t'),
                  ),
                )),
          ],
        ));
  }
}
