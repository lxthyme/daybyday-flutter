import 'dart:math' as math;
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class Category {
  final String title;
  final List<String> assets;
  const Category({this.title, this.assets});

  @override
  String toString() => '$runtimeType("$title")';
}

const List<Category> allCateories = <Category>[
  Category(
    title: 'Accessories',
    assets: <String>[
      'products/belt.png',
      'products/earrings.png',
      'products/backpack.png',
      'products/hat.png',
      'products/scarf.png',
      'products/sunnies.png',
    ],
  ),
  Category(
    title: 'Blue',
    assets: <String>[
      'products/backpack.png',
      'products/cup.png',
      'products/napkins.png',
      'products/top.png',
    ],
  ),
  Category(
    title: 'Cold Weather',
    assets: <String>[
      'products/jacket.png',
      'products/jumper.png',
      'products/scarf.png',
      'products/sweater.png',
      'products/sweats.png',
    ],
  ),
  Category(
    title: 'Home',
    assets: <String>[
      'products/cup.png',
      'products/napkins.png',
      'products/planters.png',
      'products/table.png',
      'products/teaset.png',
    ],
  ),
  Category(
    title: 'Tops',
    assets: <String>[
      'products/jumper.png',
      'products/shirt.png',
      'products/sweater.png',
      'products/top.png',
    ],
  ),
  Category(
    title: 'Everything',
    assets: <String>[
      'products/backpack.png',
      'products/belt.png',
      'products/cup.png',
      'products/dress.png',
      'products/earrings.png',
      'products/flatwear.png',
      'products/hat.png',
      'products/jacket.png',
      'products/jumper.png',
      'products/napkins.png',
      'products/planters.png',
      'products/scarf.png',
      'products/shirt.png',
      'products/sunnies.png',
      'products/sweater.png',
      'products/sweats.png',
      'products/table.png',
      'products/teaset.png',
      'products/top.png',
    ],
  ),
];

class CategoryView extends StatelessWidget {
  final Category category;

  const CategoryView({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scrollbar(
      child: ListView(
        key: PageStorageKey<Category>(category),
        padding: const EdgeInsets.symmetric(
          horizontal: 64,
          vertical: 16,
        ),
        children: category.assets.map<Widget>((String asset) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  width: 144,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        asset,
                        package: 'flutter_gallery_assets',
                        fit: BoxFit.contain,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 16),
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          asset,
                          style: themeData.textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class BackdropPanel extends StatelessWidget {
  final VoidCallback onTap;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget title;
  final Widget child;

  const BackdropPanel({Key key, this.onTap, this.onVerticalDragUpdate, this.onVerticalDragEnd, this.title, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragUpdate: onVerticalDragUpdate,
            onVerticalDragEnd: onVerticalDragEnd,
            onTap: onTap,
            child: Container(
              height: 48,
              padding: const EdgeInsetsDirectional.only(start: 16),
              alignment: AlignmentDirectional.centerStart,
              child: DefaultTextStyle(
                style: themeData.textTheme.subhead,
                child: Tooltip(
                  message: 'Tap to dismiss',
                  child: title,
                ),
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class BackdropTitle extends AnimatedWidget {
  const BackdropTitle({
    Key key,
    Listenable listenable,
  }) : super(key: key, listenable: listenable);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return DefaultTextStyle(
      style: Theme.of(context).primaryTextTheme.title,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: CurvedAnimation(
              parent: ReverseAnimation(animation),
              curve: const Interval(0.5, 1),
            ).value,
            child: const Text('Select a Category'),
          ),
          Opacity(
            opacity: CurvedAnimation(
              parent: animation,
              curve: const Interval(0.5, 1),
            ).value,
            child: const Text('Asset Viewer'),
          ),
        ],
      ),
    );
  }
}

class BackdropScreen extends StatefulWidget {
  final String title;

  const BackdropScreen({Key key, this.title}) : super(key: key);

  @override
  _BackdropScreenState createState() => _BackdropScreenState();
}

class _BackdropScreenState extends State<BackdropScreen> with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'backdrop');
  AnimationController _controller;
  Category _category = allCateories[0];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(microseconds: 300),
      value: 1,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _changeCategory(Category category) {
    setState(() {
      _category = category;
      _controller.fling(velocity: 2);
    });
  }

  bool get _backdropPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed || status == AnimationStatus.forward;
  }

  void _toggleBackdropPanelVisibility() {
    _controller.fling(velocity: _backdropPanelVisible ? -2 : 2);
  }

  double get _backdropHeight {
    final RenderBox renderBox = _backdropKey.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_controller.isAnimating || _controller.status == AnimationStatus.completed) {
      return;
    }

    _controller.value -= details.primaryDelta / (_backdropHeight ?? details.primaryDelta);
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating || _controller.status == AnimationStatus.completed) {
      return;
    }

    final double flingVelocity = details.velocity.pixelsPerSecond.dy / _backdropHeight;
    if (flingVelocity < 0) {
      _controller.fling(velocity: math.max(2, -flingVelocity));
    } else if (flingVelocity > 0) {
      _controller.fling(velocity: math.min(-2, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -2 : 2);
    }
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double panelTitleHeight = 48;
    final Size panelSize = constraints.biggest;
    final double panelTop = panelSize.height - panelTitleHeight;

    final Animation<RelativeRect> panelAnimation = _controller.drive(
      RelativeRectTween(
        begin:
            RelativeRect.fromLTRB(0, panelTop - MediaQuery.of(context).padding.bottom, 0, panelTop - panelSize.height),
        end: const RelativeRect.fromLTRB(0, 0, 0, 0),
      ),
    );

    final ThemeData themeData = Theme.of(context);
    final List<Widget> backdropItems = allCateories.map<Widget>((Category category) {
      final bool selected = category == _category;
      return Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        color: selected ? Colors.white.withOpacity(0.25) : Colors.transparent,
        child: ListTile(
          title: Text(category.title),
          selected: selected,
          onTap: () {
            _changeCategory(category);
          },
        ),
      );
    }).toList();

    return Scaffold(
      body: Container(
        key: _backdropKey,
        color: themeData.primaryColor,
        child: Stack(
          children: <Widget>[
            ListTileTheme(
              iconColor: themeData.primaryIconTheme.color,
              textColor: themeData.primaryTextTheme.title.color.withOpacity(0.6),
              selectedColor: themeData.primaryTextTheme.title.color,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: backdropItems,
                ),
              ),
            ),
            PositionedTransition(
              rect: panelAnimation,
              child: BackdropPanel(
                onTap: _toggleBackdropPanelVisibility,
                onVerticalDragUpdate: _handleDragUpdate,
                onVerticalDragEnd: _handleDragEnd,
                title: Text(_category.title),
                child: CategoryView(category: _category),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: BackdropTitle(listenable: _controller.view),
        actions: <Widget>[
          IconButton(
            onPressed: _toggleBackdropPanelVisibility,
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              semanticLabel: 'close',
              progress: _controller.view,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: _buildStack,
      ),
    );
  }
}
