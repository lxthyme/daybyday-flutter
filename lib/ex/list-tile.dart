
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

final ds1Child = [
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
];
final ListView ds1 = ListView(
  padding: EdgeInsets.all(8),
  children: [
    ...ds1Child,
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

final ds2Children = [
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
];
final ds2 = ListView(
  padding: const EdgeInsets.all(8),
  itemExtent: 106,
  children: ds2Children,
);


class _ArticleDescription extends StatelessWidget {
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  const _ArticleDescription({Key key, this.title, this.subtitle, this.author, this.publishDate, this.readDuration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2)),
              Text(
                '$subtitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$author',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate · $readDuration *',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  const CustomListItemTwo({Key key, this.thumbnail, this.title, this.subtitle, this.author, this.publishDate, this.readDuration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 2, 0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final itemTwo = [
  CustomListItemTwo(
    thumbnail: Container(
      decoration: const BoxDecoration(color: Colors.pink),
    ),
    title: 'Flutter 1.0 Launch',
    subtitle:
      'Flutter continues to improve and expand its horizons.'
      'This text should max out at two lines and clip',
    author: 'Dash',
    publishDate: 'Dec 28',
    readDuration: '5 mins',
  ),
  CustomListItemTwo(
    thumbnail: Container(
      decoration: const BoxDecoration(color: Colors.blue),
    ),
    title: 'Flutter 1.2 Release - Continual updates to the framework',
    subtitle: 'Flutter once again improves and makes updates.',
    author: 'Flutter',
    publishDate: 'Feb 26',
    readDuration: '12 mins',
  ),
  CustomListItemTwo(
    thumbnail: Container(
      decoration: const BoxDecoration(color: Colors.blue),
    ),
    title: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut perferendis, nostrum numquam asperiores voluptates fuga possimus eveniet quas illum! Modi dolores illum dicta ad. Neque, odit optio. Officia, accusamus architecto.',
    subtitle: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut perferendis, nostrum numquam asperiores voluptates fuga possimus eveniet quas illum! Modi dolores illum dicta ad. Neque, odit optio. Officia, accusamus architecto.',
    author: 'Flutter',
    publishDate: 'Feb 26',
    readDuration: '12 mins',
  )
];

class ListTileWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        ...ds1Child,
        ...ds2Children,
        ...itemTwo,
      ],
    );
  }
}
