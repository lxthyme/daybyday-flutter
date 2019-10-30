
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: ListTileWrapper(),
  ));
}

int _act = 2;
final ListTile elaborateItem = ListTile(
  leading: const Icon(Icons.flight_land),
  title: const Text('Trix\' airplane'),
  subtitle: _act != 2 ? const Text('The airplane is only in Act II.') : null,
  // enabled: _act == 2,
  onTap: () {
    print("elaborateItem tapped");
  },
);

final ListTile gestureItem = ListTile(
  leading: GestureDetector(
    behavior: HitTestBehavior.translucent,
    onTap: () {
      print('gestureItem tapped');
    },
    child: Container(
      width: 48,
      height: 48,
      padding: EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.center,
      child: CircleAvatar(),
    ),
  ),
  title: Text('title'),
  dense: false,
);

final ListView ds1 = ListView(
  padding: EdgeInsets.all(8),
  children: <Widget>[
    Card(
      child: ListTile(title: Text('One-line ListTile')),
    ),
    Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('One-line with leading widget'),
      ),
    ),
    Card(
      child: ListTile(
        title: Text('One-line with trailing widget'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    Card(
      child: ListTile(
        leading: FlutterLogo(),
        title: Text('One-line with both widget'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    Card(
      child: ListTile(
        title: Text('One-line dense ListTile'),
        dense: true,
      ),
    ),
    Card(
      child: ListTile(
        leading: FlutterLogo(size: 56),
        title: Text('Two-line ListTile'),
        subtitle: Text('Here is a second line'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    Card(
      child: ListTile(
        leading: FlutterLogo(size: 72),
        title: Text('Three-line ListTile'),
        subtitle: Text('A sufficiently long subtitle warrants three lines.'),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    ),
    Card(
      child: ListTile(
        leading: FlutterLogo(size: 72),
        title: Text('Three-line ListTile'),
        subtitle: Text('Lorem, ipsum dolor sit amet consectetur adipisicing elit. Veniam, ipsa saepe deserunt fuga repellat aliquam nemo eveniet ea, dolore optio sit!'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    Card(
      child: ListTile(
        leading: FlutterLogo(size: 72),
        title: Text('Three-line ListTile'),
        subtitle: Text('Lorem, ipsum dolor sit amet consectetur adipisicing elit. Veniam, ipsa saepe deserunt fuga repellat aliquam nemo eveniet ea, dolore optio sit!'),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    ),
    Card(
      child: elaborateItem,
    ),
    Card(
      child: gestureItem,
    ),
  ],
);

class _VideoDescription extends StatelessWidget {
  final String title;
  final String user;
  final int viewCount;

  const _VideoDescription({Key key, this.title, this.user, this.viewCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
          Text(
            user,
            style: const TextStyle(fontSize: 10),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1)),
          Text(
            '$viewCount views',
            style: const TextStyle(fontSize: 10)
          ),
        ],
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  final Widget thumbnail;
  final String title;
  final String user;
  final int viewCount;

  const CustomListItem({Key key, this.thumbnail, this.title, this.user, this.viewCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _VideoDescription(
              title: title,
              user: user,
              viewCount: viewCount,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

final ds2 = ListView(
  padding: const EdgeInsets.all(8),
  itemExtent: 106,
  children: <CustomListItem>[
    CustomListItem(
      user: 'Flutter',
      viewCount: 999000,
      thumbnail: Container(
        decoration: const BoxDecoration(color: Colors.blue),
      ),
      title: 'The Flutter YouTube Channel',
    ),
    CustomListItem(
      user: 'Dash',
      viewCount: 888000,
      thumbnail: Container(
        decoration: const BoxDecoration(color: Colors.yellow),
      ),
      title: 'Announcing Flutter 1.0',
    ),
  ],
);

class ListTileWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // ds1,
        Expanded(
          child: ds1,
        ),
        Expanded(
          child: ds2,
        )
      ],
    );
  }
}
