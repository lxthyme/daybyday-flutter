import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
// debugPaintSizeEnabled = true;

  runApp(MaterialApp(
    title: 'GridView Demo',
    home: Scaffold(
        appBar: AppBar(title: Text('GridView')),
        body: Center(
          child: GridView1(),
        )),
  ));
}

class GridView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
    );
  }
}
