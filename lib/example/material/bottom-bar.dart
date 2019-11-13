import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class BottomBarScreen extends StatefulWidget {
  final String title;
  const BottomBarScreen({Key key, this.title}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class BarItemModel {
  final String title;
  final IconData iconData;

  BarItemModel(this.title, this.iconData);
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  static const optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static var _widgetOptions = <BarItemModel>[
    BarItemModel('Home', Icons.home),
    BarItemModel('Discover', Icons.search),
    BarItemModel('Location', Icons.location_on),
    BarItemModel('Message', Icons.message),
    BarItemModel('Channel', Icons.payment),
    BarItemModel('Me', Icons.account_box),
  ];

  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          _widgetOptions.elementAt(_selectedIndex).title,
          style: optionStyle,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        type: BottomNavigationBarType.fixed,
        onTap: _itemTapped,
        items: <BottomNavigationBarItem>[
          ..._widgetOptions.map((t) => BottomNavigationBarItem(
                title: Text(t.title),
                icon: Icon(t.iconData),
              ))
        ],
      ),
    );
  }
}
