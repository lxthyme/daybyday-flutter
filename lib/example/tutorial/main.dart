import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
// debugPaintSizeEnabled = true;

runApp(Tutorial5Screen());

}
class Tutorial5Screen extends StatelessWidget {
  final String title;
  const Tutorial5Screen({Key key, this.title}) : super(key: key);

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color,),
        Container(
          margin: const EdgeInsetsDirectional.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    Image logoSection = Image.asset(
      'images/lake.jpg',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground, Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore, nostrum, aperiam voluptatum neque sequi quo porro ullam magnam facere velit dicta! Eaque laborum labore blanditiis alias eum nemo modi ab?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland. Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore, nostrum, aperiam voluptatum neque sequi quo porro ullam magnam facere velit dicta! Eaque laborum labore blanditiis alias eum nemo modi ab?',
                  style: TextStyle(
                    color: Colors.grey[500]
                  )
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500]
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: ListView(
        children: [
          logoSection,
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}
