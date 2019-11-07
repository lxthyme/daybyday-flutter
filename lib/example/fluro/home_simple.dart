import 'package:flutter/material.dart';
import 'package:flutter_hw/helpers/color_helpers.dart';

class HomeSimpleComponent extends StatelessWidget {
  final String message;
  final Color color;
  final String result;

  const HomeSimpleComponent(this.message, this.color, this.result, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/acc_boom.png"),
            color: ColorHelpers.blackOrWhiteContrastColor(color),
            width: 260,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 15),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorHelpers.blackOrWhiteContrastColor(color),
                height: 2
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 42),
              child: FlatButton(
                highlightColor: ColorHelpers.blackOrWhiteContrastColor(color).withAlpha(17),
                splashColor: ColorHelpers.blackOrWhiteContrastColor(color).withAlpha(34),
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18,
                    color: ColorHelpers.blackOrWhiteContrastColor(color),
                  ),
                ),
                onPressed: () {
                  if(result == null) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context, result);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
