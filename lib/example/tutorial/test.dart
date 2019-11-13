import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class TestScreen extends StatelessWidget {
  final String title;
  const TestScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView(
          shrinkWrap: false,
          children: <Widget>[
            TestView(),
            TestView2(),
          ],
        ));
  }
}

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        ...new List<int>.generate(10, (i) => i + 1).map((t) => ListTile(
              title: Text('inner Item $t'),
            )),
        ListView(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        ...new List<int>.generate(30, (i) => i + 1).map((t) => ListTile(
              title: Text('inner Item $t'),
            )),
        ListView(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
