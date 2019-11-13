import 'package:flutter/material.dart';
import 'package:flutter_hw/gallery/about.dart';
import 'package:flutter_hw/gallery/scales.dart';

class GalleryOptions {
  final ThemeMode themeMode;
  final GalleryTextScaleValue textScaleFactor;
  final TextDirection textDirection;
  final double timeDilation;
  final TargetPlatform targetPlatform;
  final bool showPerformanceOverlay;
  final bool showRasterCacheImagesCheckerboard;
  final bool showOffscreenLayersCheckerboard;

  GalleryOptions({
    this.themeMode,
    this.textScaleFactor,
    this.textDirection = TextDirection.ltr,
    this.timeDilation = 1.0,
    this.targetPlatform,
    this.showPerformanceOverlay = false,
    this.showRasterCacheImagesCheckerboard = false,
    this.showOffscreenLayersCheckerboard = false,
  });

  GalleryOptions copyWith({
    ThemeMode themeMode,
    GalleryTextScaleValue textScaleFactor,
    TextDirection textDirection,
    double timeDilation,
    TargetPlatform targetPlatform,
    bool showPerformanceOverlay,
    bool showRasterCacheImagesCheckerboard,
    bool showOffscreenLayersCheckerboard,
  }) {
    return GalleryOptions(
      themeMode: themeMode ?? this.themeMode,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      textDirection: textDirection ?? this.textDirection,
      timeDilation: timeDilation ?? this.timeDilation,
      targetPlatform: targetPlatform ?? this.targetPlatform,
      showPerformanceOverlay: showPerformanceOverlay ?? this.showPerformanceOverlay,
      showOffscreenLayersCheckerboard: showOffscreenLayersCheckerboard ?? this.showOffscreenLayersCheckerboard,
      showRasterCacheImagesCheckerboard: showRasterCacheImagesCheckerboard ?? this.showRasterCacheImagesCheckerboard,
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) {
      return false;
    }
    final GalleryOptions typedOther = other;
    return themeMode == typedOther.themeMode &&
        textScaleFactor == typedOther.textScaleFactor &&
        textDirection == typedOther.textDirection &&
        targetPlatform == typedOther.targetPlatform &&
        showPerformanceOverlay == typedOther.showPerformanceOverlay &&
        showRasterCacheImagesCheckerboard == typedOther.showPerformanceOverlay &&
        showOffscreenLayersCheckerboard == typedOther.showPerformanceOverlay;
  }

  @override
  int get hashCode => hashValues(
        themeMode,
        textScaleFactor,
        textDirection,
        timeDilation,
        targetPlatform,
        showPerformanceOverlay,
        showRasterCacheImagesCheckerboard,
        showOffscreenLayersCheckerboard,
      );

  @override
  String toString() {
    return '$runtimeType($themeMode)';
  }
}

const double _kItemHeight = 48;

const EdgeInsetsDirectional _kItemPadding = EdgeInsetsDirectional.only(start: 56);

class _OptionsItem extends StatelessWidget {
  const _OptionsItem({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = MediaQuery.textScaleFactorOf(context);

    return MergeSemantics(
      child: Container(
        constraints: BoxConstraints(minHeight: _kItemHeight * textScaleFactor),
        padding: _kItemPadding,
        alignment: AlignmentDirectional.centerStart,
        child: DefaultTextStyle(
          style: DefaultTextStyle.of(context).style,
          maxLines: 2,
          overflow: TextOverflow.fade,
          child: IconTheme(
            data: Theme.of(context).primaryIconTheme,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _BoolItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  // [switchKey] is used for accessing the switch from driver tests.
  final Key switchKey;
  const _BoolItem(this.title, this.value, this.onChanged, {this.switchKey});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(title),
          ),
          Switch(
            key: switchKey,
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xff39cefd),
            activeTrackColor: isDark ? Colors.white30 : Colors.black26,
          ),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _ActionItem({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: _FlatButton(
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}

class _FlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const _FlatButton({Key key, this.onPressed, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: DefaultTextStyle(
        style: Theme.of(context).primaryTextTheme.subhead,
        child: child,
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  final String text;
  const _Heading({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return _OptionsItem(
      child: DefaultTextStyle(
        style: themeData.textTheme.body1.copyWith(
          fontFamily: 'GoogleSans',
          color: themeData.accentColor,
        ),
        child: Semantics(
          child: Text(text),
          header: true,
        ),
      ),
    );
  }
}

class _ThemeModeItem extends StatelessWidget {
  final GalleryOptions options;
  final ValueChanged<GalleryOptions> onOptionsChanged;
  const _ThemeModeItem({Key key, this.options, this.onOptionsChanged}) : super(key: key);

  static final Map<ThemeMode, String> modeLabels = <ThemeMode, String>{
    ThemeMode.system: 'System Default',
    ThemeMode.light: 'Light',
    ThemeMode.dark: 'Dark',
  };
  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Theme'),
                Text(
                  '${modeLabels[options.themeMode]}',
                  style: Theme.of(context).primaryTextTheme.body1,
                )
              ],
            ),
          ),
          PopupMenuButton<ThemeMode>(
            padding: const EdgeInsetsDirectional.only(end: 16),
            icon: const Icon(Icons.arrow_drop_down),
            initialValue: options.themeMode,
            onSelected: (t) {
              onOptionsChanged(
                options.copyWith(themeMode: t),
              );
            },
            itemBuilder: (BuildContext context) {
              return ThemeMode.values
                  .map((t) => PopupMenuItem(
                        value: t,
                        child: Text(modeLabels[t]),
                      ))
                  .toList();
            },
          ),
        ],
      ),
    );
  }
}

class _TextScaleFactorItem extends StatelessWidget {
  final GalleryOptions options;
  final ValueChanged<GalleryOptions> onOptionsChanged;
  const _TextScaleFactorItem({Key key, this.options, this.onOptionsChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Text size'),
                Text(
                  '${options.textScaleFactor.label}',
                  style: Theme.of(context).primaryTextTheme.body1,
                ),
              ],
            ),
          ),
          PopupMenuButton<GalleryTextScaleValue>(
            padding: const EdgeInsetsDirectional.only(end: 16),
            icon: const Icon(Icons.arrow_drop_down),
            onSelected: (t) {
              onOptionsChanged(options.copyWith(textScaleFactor: t));
            },
            itemBuilder: (BuildContext context) {
              return kAllGalleryTextScaleValues
                  .map((t) => PopupMenuItem(
                        value: t,
                        child: Text(t.label),
                      ))
                  .toList();
            },
          ),
        ],
      ),
    );
  }
}

class _TextDirectionItem extends StatelessWidget {
  final GalleryOptions options;
  final ValueChanged<GalleryOptions> onOptionsChanged;
  const _TextDirectionItem({Key key, this.options, this.onOptionsChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BoolItem(
      'Force RTL',
      options.textDirection == TextDirection.rtl,
      (t) {
        onOptionsChanged(
          options.copyWith(textDirection: t ? TextDirection.rtl : TextDirection.ltr),
        );
      },
      switchKey: const Key('text_direction'),
    );
  }
}

class _TimeDilationItem extends StatelessWidget {
  final GalleryOptions options;
  final ValueChanged<GalleryOptions> onOptionsChanged;
  const _TimeDilationItem({Key key, this.options, this.onOptionsChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BoolItem(
      'Slow motion',
      options.timeDilation != 1.0,
      (t) {
        onOptionsChanged(
          options.copyWith(timeDilation: t ? 2.0 : 1.0),
        );
      },
      switchKey: const Key('slow_motion'),
    );
  }
}

class _PlatformItem extends StatelessWidget {
  final GalleryOptions options;
  final ValueChanged<GalleryOptions> onOptionsChanged;
  const _PlatformItem({Key key, this.options, this.onOptionsChanged}) : super(key: key);

  String _platformLabel(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return 'Mountain View';
      case TargetPlatform.fuchsia:
        return 'Fuchsia';
      case TargetPlatform.iOS:
        return 'Cupertino';
    }
    assert(false);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Platform mechanics'),
                Text(
                  '${_platformLabel(options.targetPlatform)}',
                  style: Theme.of(context).primaryTextTheme.body1,
                ),
              ],
            ),
          ),
          PopupMenuButton<TargetPlatform>(
            padding: const EdgeInsetsDirectional.only(end: 16),
            icon: const Icon(Icons.arrow_drop_down),
            onSelected: (t) {
              onOptionsChanged(
                options.copyWith(targetPlatform: t),
              );
            },
            itemBuilder: (BuildContext context) {
              return TargetPlatform.values
                  .map((t) => PopupMenuItem(
                        value: t,
                        child: Text(_platformLabel(t)),
                      ))
                  .toList();
            },
          )
        ],
      ),
    );
  }
}

class GalleryOptionsPage extends StatelessWidget {
  final GalleryOptions options;
  final ValueChanged<GalleryOptions> onOptionsChanged;
  final VoidCallback onSendFeedback;
  const GalleryOptionsPage({Key key, this.options, this.onOptionsChanged, this.onSendFeedback}) : super(key: key);

  List<Widget> _enabledDiagnosticItems() {
    if (options.showOffscreenLayersCheckerboard == null &&
        options.showRasterCacheImagesCheckerboard == null &&
        options.showPerformanceOverlay == null) {
      return const <Widget>[];
    }

    final List<Widget> items = <Widget>[
      const Divider(),
      const _Heading(
        text: 'Diagnostics',
      ),
    ];

    if (options.showOffscreenLayersCheckerboard != null) {
      items.add(
        _BoolItem('Highlight offscreen layers', options.showOffscreenLayersCheckerboard, (t) {
          onOptionsChanged(
            options.copyWith(showOffscreenLayersCheckerboard: t),
          );
        }),
      );
    }

    if (options.showRasterCacheImagesCheckerboard != null) {
      items.add(
        _BoolItem('Highlight raster cache images', options.showRasterCacheImagesCheckerboard, (t) {
          onOptionsChanged(
            options.copyWith(showRasterCacheImagesCheckerboard: t),
          );
        }),
      );
    }

    if (options.showPerformanceOverlay != null) {
      items.add(
        _BoolItem('Show performance overlay', options.showPerformanceOverlay, (t) {
          onOptionsChanged(
            options.copyWith(showPerformanceOverlay: t),
          );
        }),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return DefaultTextStyle(
      style: themeData.primaryTextTheme.subhead,
      child: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: <Widget>[
          const _Heading(text: 'Display'),
          _ThemeModeItem(options: options, onOptionsChanged: onOptionsChanged),
          _TextScaleFactorItem(options: options, onOptionsChanged: onOptionsChanged),
          _TextDirectionItem(options: options, onOptionsChanged: onOptionsChanged),
          _TimeDilationItem(options: options, onOptionsChanged: onOptionsChanged),
          const Divider(),
          const _Heading(text: 'Platform mechanics'),
          _PlatformItem(options: options, onOptionsChanged: onOptionsChanged),
          ..._enabledDiagnosticItems(),
          const Divider(),
          const _Heading(text: 'Flutter gallery'),
          _ActionItem(
            text: 'About Flutter Gallery',
            onTap: () {
              showGalleryAboutDialog(context);
            },
          ),
          _ActionItem(text: 'Send feedback', onTap: onSendFeedback),
        ],
      ),
    );
  }
}
