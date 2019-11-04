import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
// debugPaintSizeEnabled = true;

runApp(MaterialApp(
  title: 'Alert Ex',
  home: Scaffold(
    appBar: AppBar(
      title: Text('Alert Ex')
    ),
    body: Center(
      child: DialogDemo(),
    )
  ),
));
}

enum DialogAction {
  cancel,
  discard,
  disagree,
  agree
}

const String _alertWithoutTitleText = "Discard draft?";

const String _alertWithTitleText =
  'Let Google help apps determine location. This means sending anonymous location '
  'data to Google, even when no apps are running.';

class DialogItem extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const DialogItem({Key key, this.iconData, this.color, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 36,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}

class DialogDemo extends StatefulWidget {
  static const String routeName = '/material/dialog';

  DialogDemo({Key key}) : super(key: key);

  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    final DateTime now = DateTime.now();
    _selectedTime = TimeOfDay(hour: now.hour, minute: now.minute);
  }

  void showDemoDialog<T>({ BuildContext context, Widget child }) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T t) {
      if(t != null) {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text('You selected: $t')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Dialogs'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.library_books),
            tooltip: 'API documentation',
            onPressed: () => print('pressed API Documentation'),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 72),
        children: <Widget>[
          RaisedButton(
            child: const Text('ALERT'),
            onPressed: () {
              showDemoDialog<DialogAction>(
                context: context,
                child: AlertDialog(
                  content: Text(
                    _alertWithoutTitleText,
                    style: dialogTextStyle,
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                        Navigator.pop(context, DialogAction.cancel);
                      },
                    ),
                    FlatButton(
                      child: const Text('DISCARD'),
                      onPressed: () {
                        Navigator.pop(context, DialogAction.discard);
                      },
                    )
                  ],
                ),
              );
            },
          ),
          RaisedButton(
            child: const Text('ALERT WITH TITLE'),
            onPressed: () {
              showDemoDialog<DialogAction>(
                context: context,
                child: AlertDialog(
                  title: const Text('Use Google\'s location service?'),
                  content: Text(
                    _alertWithTitleText,
                    style: dialogTextStyle,
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: const Text('DISAGREE'),
                      onPressed: () {
                        Navigator.pop(context, DialogAction.disagree);
                      },
                    ),
                    FlatButton(
                      child: const Text('AGREE'),
                      onPressed: () {
                        Navigator.pop(context, DialogAction.agree);
                      },
                    )
                  ],
                )
              );
            },
          ),
          RaisedButton(
            child: const Text('SIMPLE'),
            onPressed: () {
              showDemoDialog<String>(
                context: context,
                child: SimpleDialog(
                  title: const Text('Set backup account'),
                  children: <Widget>[
                    DialogItem(
                      iconData: Icons.account_circle,
                      color: theme.primaryColor,
                      text: 'username@gmail.com',
                      onPressed: () { Navigator.pop(context, 'username@gmail.com'); },
                    ),
                    DialogItem(
                      iconData: Icons.account_circle,
                      color: theme.primaryColor,
                      text: 'user02@gmail.com',
                      onPressed: () { Navigator.pop(context, 'user02@gmail.com'); },
                    ),
                    DialogItem(
                      iconData: Icons.add_circle,
                      text: 'add account',
                      color: theme.disabledColor,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
