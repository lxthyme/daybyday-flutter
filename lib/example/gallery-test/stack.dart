import 'package:flutter/material.dart';


class StackScreen extends StatelessWidget {
  final String title;
  const StackScreen({Key key, this.title}) : super(key: key);

  static final showCard = false;

  Widget _buildCard() => SizedBox(
        height: 220,
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: const Text(
                  '1625 Main Street',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text('My City, CA 99984'),
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  '(408) 555-1212',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: Icon(
                  Icons.contact_phone,
                  color: Colors.blue[500],
                ),
              ),
              ListTile(
                title: Text('costa@example.com'),
                leading: Icon(
                  Icons.contact_mail,
                  color: Colors.blue[500],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildStack() => Stack(
        alignment: const Alignment(0.6, 0.6),
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/go.png'),
            radius: 100,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Mia B',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: showCard ? _buildCard() : _buildStack(),
      ),
    );
  }
}
