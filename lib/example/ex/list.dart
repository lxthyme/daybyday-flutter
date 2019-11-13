import 'package:flutter/material.dart';

final List<Widget> ds = [
  Container(
    height: 50,
    color: Colors.amber[600],
    child: const Center(child: Text('Entry A')),
  ),
  Container(
    height: 50,
    color: Colors.amber[500],
    child: const Center(child: Text('Entry B')),
  ),
  Container(
    height: 50,
    color: Colors.amber[100],
    child: const Center(child: Text('Entry C')),
  ),
];

final List<String> ds2 = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class ListScreen extends StatelessWidget {
  final String title;
  ListScreen({Key key, this.title}) : super(key: key);

  final list1 = ListView(
    padding: const EdgeInsets.all(16),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: ds,
  );

  final list2 = ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: ds2.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int idx) {
      return Container(
        height: 50,
        color: Colors.amber[colorCodes[idx]],
        child: Center(
          child: Text('list2 ${ds2[idx]}'),
        ),
      );
    },
  );

  final list3 = ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: ds2.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int idx) {
      return Container(
        height: 50,
        color: Colors.amber[colorCodes[idx]],
        child: Center(
          child: Text('list3 ${ds2[idx]}'),
        ),
      );
    },
    separatorBuilder: (BuildContext context, int idx) => const Divider(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: Column(
        children: <Widget>[...ds, list1, list2, list3],
      ),
    );
  }
}
