import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
// debugPaintSizeEnabled = true;

runApp(MaterialApp(
  title: 'Card Ex',
  home: Scaffold(
    appBar: AppBar(
      title: Text('Card Ex')
    ),
    body: Center(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          CardEx(),
          CardEx2(),
        ],
      ),
    )
  ),
));
}


class CardEx extends StatelessWidget {
  const CardEx({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightgale'),
              subtitle: Text('Music by Juie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('BUY TICKETS'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: const Text('LISTEN'),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardEx2 extends StatelessWidget {
  const CardEx2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            width: 300,
            height: 300,
            child: Text('A card that can be tapped.'),
          ),
        ),
      ),
    );
  }
}
