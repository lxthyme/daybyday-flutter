import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
// debugPaintSizeEnabled = true;

  runApp(MaterialApp(
    title: 'Test ListView',
    home: Scaffold(
        appBar: AppBar(title: Text('Flutter layout demo')),
        body: Center(
          child: TestView2(),
        )),
  ));
}

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...new List<int>.generate(10, (i) => i + 1).map((t) => ListTile(
              title: Text('inner Item $t'),
            )),
        ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ...new List<int>.generate(5, (i) => i + 1).map((t) => ListTile(
                  title: Text('Item $t'),
                )),
          ],
        ),
      ],
    );
  }
}

class TestView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...new List<int>.generate(30, (i) => i + 1).map((t) => ListTile(
              title: Text('inner Item $t'),
            )),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ...new List<int>.generate(30, (i) => i + 1).map((t) => ListTile(
                  title: Text('Item $t'),
                )),
          ],
        ),
      ],
    );
  }
}
