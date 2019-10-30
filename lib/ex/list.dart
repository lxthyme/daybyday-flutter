import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: ListWrapper(),
  ));
}

// class ListItem extends StatelessWidget {
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(title),
//     );
//   }

// }

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

class ListWrapper extends StatelessWidget {
  final ListView list1 = ListView(
    padding: const EdgeInsets.all(16),
    // children: ds,
    children: ds,
  );

  final ListView list2 = ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: ds2.length,
    itemBuilder: (BuildContext context, int idx) {
      return Container(
        height: 50,
        color: Colors.amber[colorCodes[idx]],
        child: Center(
          child: Text('Entry ${ds2[idx]}'),
        ),
      );
    },
  );

  final ListView list3 = ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: ds2.length,
    itemBuilder: (BuildContext context, int idx) {
      return Container(
        height: 50,
        color: Colors.amber[colorCodes[idx]],
        child: Center(
          child: Text('Entry ${ds2[idx]}'),
        ),
      );
    },
    separatorBuilder: (BuildContext context, int idx) => const Divider(),
  );

  @override
  Widget build(BuildContext context) {
    return list3;
  }

}
