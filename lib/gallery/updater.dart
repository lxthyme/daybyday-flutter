import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

typedef UpdateUrlFetcher = Future<String> Function();

class Updater extends StatefulWidget {
  final UpdateUrlFetcher updateUrlFetcher;
  final Widget child;
  Updater({Key key, this.updateUrlFetcher, this.child}) : super(key: key);

  @override
  _UpdaterState createState() => _UpdaterState();
}

class _UpdaterState extends State<Updater> {
  static DateTime _lastUpdateCheck;

  Future<void> _checkForUpdates() async {
    if (_lastUpdateCheck != null && DateTime.now().difference(_lastUpdateCheck) < const Duration(days: 1)) {
      return;
    }

    _lastUpdateCheck = DateTime.now();

    final String updateUrl = await widget.updateUrlFetcher();
    if (updateUrl != null) {
      final bool wantsUpdate = await showDialog<bool>(context: context, builder: _buildDialog);
      if (wantsUpdate != null && wantsUpdate) {
        launch(updateUrl);
      }
    }
  }

  Widget _buildDialog(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle dialogTextStyle = themeData.textTheme.subhead.copyWith(color: themeData.textTheme.caption.color);

    return AlertDialog(
      title: const Text('Update Flutter Gallery?'),
      content: Text(
        'A newer version is available.',
        style: dialogTextStyle,
      ),
      actions: <Widget>[
        FlatButton(
          child: const Text('No Thanks!'),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        FlatButton(
          child: const Text('Update'),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
