import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hw/gallery/backdrop.dart';
import 'package:flutter_hw/gallery/demos.dart';
import 'dart:math' as math;

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

const Color _kFlutterBlue = Color(0xff003d75);

const double _kDemoItemHeight = 64;

const Duration _kFrontLayerSwitchDuration = Duration(microseconds: 300);

class _FlutterLogo extends StatelessWidget {
  const _FlutterLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 34,
        height: 34,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'logos/flutter_white/logo.png',
              package: _kGalleryAssetsPackage,
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final GalleryDemoCategory category;
  final VoidCallback onTap;
  const _CategoryItem({Key key, this.category, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final bool isDark = themeData.brightness == Brightness.dark;
    return RepaintBoundary(
      child: RawMaterialButton(
        padding: EdgeInsets.zero,
        hoverColor: themeData.primaryColor.withAlpha(0.05),
        splashColor: themeData.primaryColor.withAlpha(0.12),
        highlightColor: Colors.transparent,
        onPressed: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6),
              child: Icon(
                category.iconData,
                size: 60,
                color: isDark ? Colors.white : _kFlutterBlue,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 48,
              alignment: Alignment.center,
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: themeData.textTheme.subhead.copyWith(
                  fontFamily: 'GoogleSans',
                  color: isDark ? Colors.white : _kFlutterBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoriesPage extends StatelessWidget {
  final Iterable<GalleryDemoCategory> categories;
  final ValueChanged<GalleryDemoCategory> onCategoryTap;
  const _CategoriesPage({Key key, this.categories, this.onCategoryTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double aspectRatio = 160.0 / 180.0;
    final List<GalleryDemoCategory> categoriesList = categories.toList();
    final int columnCount = (MediaQuery.of(context).orientation == Orientation.portrait) ? 2 : 3;
    return Semantics(
      scopesRoute: true,
      namesRoute: true,
      label: 'categories',
      explicitChildNodes: true,
      child: SingleChildScrollView(
        key: const PageStorage<String>('categories'),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double columnWidth = constraints.biggest.width / columnCount.toDouble();
            final double rowHeight = math.min(225, columnWidth * aspectRatio);
            final int rowCount = (categories.length + columnCount - 1) ~/ columnCount;

            return RepaintBoundary(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List<Widget>.generate(rowCount, (rowIndex) {
                  final int columnCountForRow = rowIndex == rowCount - 1
                      ? categories.length - columnCount * math.max(0, rowCount - 1)
                      : columnCount;

                  return Row(
                    children: List<Widget>.generate(columnCountForRow, (columnIndex) {
                      final int index = rowIndex * columnCount + columnIndex;
                      final GalleryDemoCategory category = categoriesList[index];

                      return SizedBox(
                        width: columnWidth,
                        height: rowHeight,
                        child: _CategoryItem(
                          category: category,
                          onTap: () {
                            onCategoryTap(category);
                          },
                        ),
                      );
                    }),
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DemoItem extends StatelessWidget {
  final GalleryDemo demo;

  const _DemoItem({Key key, this.demo}) : super(key: key);

  void _launchDemo(BuildContext context) {
    if (demo.routeName != null) {
      Timeline.instantSync('Start Transition', arguments: <String, String>{
        'from': '/',
        'to': demo.routeName,
      });

      Navigator.pushNamed(context, demo.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final bool isDark = themeData.brightness == Brightness.dark;
    final double textScaleFactor = MediaQuery.textScaleFactorOf(context);

    final titleChildren = <Widget>[
      Text(
        demo.title,
        style: themeData.textTheme.subhead.copyWith(
          color: isDark ? Colors.white : const Color(0xff202124),
        ),
      ),
    ];

    if (demo.subtitle != null) {
      titleChildren.add(
        Text(
          demo.subtitle,
          style: themeData.textTheme.body2.copyWith(
            color: isDark ? Colors.white : const Color(0xFF60646b),
          ),
        ),
      );
    }

    return RawMaterialButton(
      padding: EdgeInsets.zero,
      splashColor: themeData.primaryColor.withAlpha(0.12),
      highlightColor: Colors.transparent,
      onPressed: () {
        _launchDemo(context);
      },
      child: Container(
        constraints: BoxConstraints(minHeight: _kDemoItemHeight * textScaleFactor),
        child: Row(
          children: <Widget>[
            Container(
              width: 56,
              height: 56,
              alignment: Alignment.center,
              child: Icon(
                demo.iconData,
                size: 24,
                color: isDark ? Colors.white : _kFlutterBlue,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: titleChildren,
              ),
            ),
            const SizedBox(width: 44),
          ],
        ),
      ),
    );
  }
}

class _DemoPage extends StatelessWidget {
  final GalleryDemoCategory category;
  const _DemoPage({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double windowBottomPadding = MediaQuery.of(context).padding.bottom;
    return KeyedSubtree(
      key: const ValueKey<String>('GalleryDemoList'),
      child: Semantics(
        scopesRoute: true,
        namesRoute: true,
        label: category.name,
        explicitChildNodes: true,
        child: ListView(
          dragStartBehavior: DragStartBehavior.down,
          key: PageStorageKey<String>(category.name),
          padding: EdgeInsets.only(top: 8, bottom: windowBottomPadding),
          children: kGalleryCategoryToDemos[category].map((t) {
            return _DemoItem(demo: t);
          }).toList(),
        ),
      ),
    );
  }
}

class GalleryHome extends StatefulWidget {
  final Widget optionsPage;
  final bool testMode;
  GalleryHome({Key key, this.optionsPage, this.testMode}) : super(key: key);

  static bool showPreviewBanner = true;

  @override
  _GalleryHomeState createState() => _GalleryHomeState();
}

class _GalleryHomeState extends State<GalleryHome> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<Scaffold>();

  AnimationController _controller;
  GalleryDemoCategory _category;

  static Widget _topHomeLayout(Widget currentChild, List<Widget> previewChildren) {
    List<Widget> children = previewChildren;
    if (currentChild != null) {
      children = children.toList()..add(currentChild);
      return Stack(
        alignment: Alignment.topCenter,
        children: children,
      );
    }
  }

  static const AnimatedSwitcherLayoutBuilder _centerHomeLayout = AnimatedSwitcher.defaultLayoutBuilder;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(microseconds: 600),
      debugLabel: 'preview banner',
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final bool isDark = themeData.brightness == Brightness.dark;
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final bool centerHome = mediaQueryData.orientation == Orientation.portrait && mediaQueryData.size.height < 800;

    const Curve switchOutCurve = Interval(0.4, 1.0, curve: Curves.fastOutSlowIn);
    const Curve switchInCurve = Interval(0.4, 1.0, curve: Curves.fastOutSlowIn);

    Widget home = Scaffold(
      key: _scaffoldKey,
      backgroundColor: isDark ? _kFlutterBlue : themeData.primaryColor,
      body: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: () {
            if (_category != null) {
              setState(() {
                _category = null;
              });
              return Future<bool>.value(false);
            }
            return Future<bool>.value(true);
          },
          child: Backdrop(
            backTitle: const Text('Options'),
            backLayer: widget.optionsPage,
            frontAction: AnimatedSwitcher(
              duration: _kFrontLayerSwitchDuration,
              switchOutCurve: switchOutCurve,
              switchInCurve: switchInCurve,
              child: _category == null
                  ? const _FlutterLogo()
                  : IconButton(
                      icon: const BackButtonIcon(),
                      tooltip: 'Back',
                      onPressed: () => setState(() => _category = null),
                    ),
            ),
            frontTitle: AnimatedSwitcher(
              duration: _kFrontLayerSwitchDuration,
              child: _category == null ? const Text('Flutter gallery') : Text(_category.name),
            ),
            frontHeading: widget.testMode ? null : Container(height: 24),
            frontLayer: AnimatedSwitcher(
                duration: _kFrontLayerSwitchDuration,
                switchOutCurve: switchOutCurve,
                switchInCurve: switchInCurve,
                layoutBuilder: centerHome ? _centerHomeLayout : _topHomeLayout,
                child: _category == null
                    ? _DemoPage(category: _category)
                    : _CategoriesPage(
                        categories: kAllGalleryDemoCategories,
                        onCategoryTap: (t) {
                          setState(() {
                            _category = t;
                          });
                        },
                      )),
          ),
        ),
      ),
    );

    assert(() {
      GalleryHome.showPreviewBanner = false;
      return true;
    }());

    if (GalleryHome.showPreviewBanner) {
      home = Stack(
        fit: StackFit.expand,
        children: <Widget>[
          home,
          FadeTransition(
            opacity: CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
            child: const Banner(
              message: 'PREVIEW',
              location: BannerLocation.topEnd,
            ),
          ),
        ],
      );
    }

    home = AnnotatedRegion<SystemUiOverlayStyle>(
      child: home,
      value: SystemUiOverlayStyle.light,
    );

    return home;
  }
}
