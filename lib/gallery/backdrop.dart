import 'dart:math' as math;

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kFrontHeadingHeight = 32;
const double _kFrontClosedHeight = 92;
const double _kBackAppBarHeight = 56;

final Animatable<BorderRadius> _kFrontHeadingBevelRadius = BorderRadiusTween(
  begin: const BorderRadius.only(
    topLeft: Radius.circular(12),
    topRight: Radius.circular(12),
  ),
  end: const BorderRadius.only(
    topLeft: Radius.circular(_kFrontHeadingHeight),
    topRight: Radius.circular(_kFrontHeadingHeight),
  ),
);

class _TappableWhileStatusIs extends StatefulWidget {
  final AnimationController controller;
  final AnimationStatus status;
  final Widget child;
  _TappableWhileStatusIs({Key key, this.controller, this.status, this.child}) : super(key: key);

  @override
  __TappableWhileStatusIsState createState() => __TappableWhileStatusIsState();
}

class __TappableWhileStatusIsState extends State<_TappableWhileStatusIs> {
  bool _active;

  void _handleStatusChange(AnimationStatus status) {
    final bool value = widget.controller.status == widget.status;
    if (_active != value) {
      setState(() {
        _active = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addStatusListener(_handleStatusChange);
    _active = widget.controller.status == widget.status;
  }

  @override
  void dispose() {
    widget.controller.removeStatusListener(_handleStatusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !_active,
      child: widget.child,
    );
  }
}

class _CrossFadeTransition extends AnimatedWidget {
  final AlignmentGeometry alignmentGeometry;
  final Widget child0;
  final Widget child1;

  _CrossFadeTransition({
    Key key,
    this.alignmentGeometry = Alignment.center,
    Animation<double> progress,
    this.child0,
    this.child1,
  }) : super(key: key, listenable: progress);

  @override
  Widget build(BuildContext context) {
    final Animation<double> progress = listenable;

    final double opacity1 = CurvedAnimation(
      parent: ReverseAnimation(progress),
      curve: const Interval(0.5, 1.0),
    ).value;

    final double opacity2 = CurvedAnimation(
      parent: progress,
      curve: const Interval(0.5, 1.0),
    ).value;

    return Stack(
      alignment: alignmentGeometry,
      children: <Widget>[
        Opacity(
          opacity: opacity1,
          child: Semantics(
            scopesRoute: true,
            explicitChildNodes: true,
            child: child1,
          ),
        ),
        Opacity(
          opacity: opacity2,
          child: Semantics(
            scopesRoute: true,
            explicitChildNodes: true,
            child: child0,
          ),
        ),
      ],
    );
  }
}

class _BackAppBar extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget trailing;
  const _BackAppBar({
    Key key,
    this.leading = const SizedBox(
      width: 56,
    ),
    @required this.title,
    this.trailing,
  })  : assert(leading != null),
        assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[
      Container(
        alignment: Alignment.center,
        width: 56,
        child: leading,
      ),
      Expanded(
        child: title,
      ),
    ];

    if (trailing != null) {
      children.add(Container(
        alignment: Alignment.center,
        width: 56,
        child: trailing,
      ));
    }

    final ThemeData themeData = Theme.of(context);

    return IconTheme.merge(
      data: themeData.primaryIconTheme,
      child: DefaultTextStyle(
        style: themeData.primaryTextTheme.title,
        child: SizedBox(
          height: _kBackAppBarHeight,
          child: Row(children: children),
        ),
      ),
    );
  }
}

class Backdrop extends StatefulWidget {
  final Widget frontAction;
  final Widget frontTitle;
  final Widget frontLayer;
  final Widget frontHeading;
  final Widget backTitle;
  final Widget backLayer;
  Backdrop(
      {Key key, this.frontAction, this.frontTitle, this.frontLayer, this.frontHeading, this.backTitle, this.backLayer})
      : super(key: key);

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop> with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  AnimationController _controller;
  Animation<double> _frontOpacity;

  static final Animatable<double> _frontOpacityTween = Tween<double>(begin: 0.2, end: 1.0).chain(
    CurveTween(
      curve: const Interval(0.0, 0.4, curve: Curves.easeInOut),
    ),
  );

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
    _frontOpacity = _controller.drive(_frontOpacityTween);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get _backdropHeight {
    final RenderBox renderBox = _backdropKey.currentContext.findRenderObject();
    return math.max(0, renderBox.size.height - _kBackAppBarHeight - _kFrontClosedHeight);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
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
      _controller.fling(velocity: math.max(-2, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -2 : 2);
    }
  }

  void _toggleFrontLayer() {
    final AnimationStatus status = _controller.status;
    final bool isOpen = status == AnimationStatus.completed || status == AnimationStatus.forward;

    _controller.fling(velocity: isOpen ? -2 : 2);
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final Animation<RelativeRect> frontRelativeRect = _controller.drive(RelativeRectTween(
      begin: RelativeRect.fromLTRB(0, constraints.biggest.height - _kFrontClosedHeight, 0, 0),
      end: const RelativeRect.fromLTRB(0, _kBackAppBarHeight, 0, 0),
    ));

    final List<Widget> layers = <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _BackAppBar(
            leading: widget.frontAction,
            title: _CrossFadeTransition(
              progress: _controller,
              alignmentGeometry: AlignmentDirectional.centerStart,
              child0: Semantics(namesRoute: true, child: widget.frontTitle),
              child1: Semantics(namesRoute: true, child: widget.backTitle),
            ),
            trailing: IconButton(
              onPressed: _toggleFrontLayer,
              tooltip: 'Toogle options page',
              icon: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _controller,
              ),
            ),
          ),
          Expanded(
            child: Visibility(
              // child: widget.backLayer,
              child: Text('widget.backLayer'),
              visible: _controller.status != AnimationStatus.completed,
              maintainState: true,
            ),
          ),
        ],
      ),
      PositionedTransition(
        rect: frontRelativeRect,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget child) {
            return PhysicalShape(
              elevation: 12,
              color: Theme.of(context).canvasColor,
              clipper: ShapeBorderClipper(
                shape: BeveledRectangleBorder(
                  borderRadius: _kFrontHeadingBevelRadius.transform(_controller.value),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: child,
            );
          },
          child: _TappableWhileStatusIs(
            status: AnimationStatus.completed,
            controller: _controller,
            child: FadeTransition(
              opacity: _frontOpacity,
              // child: widget.frontLayer,
              child: Text('widget.frontLayer'),
            ),
          ),
        ),
      ),
    ];

    if (widget.frontHeading != null) {
      layers.add(
        PositionedTransition(
          rect: frontRelativeRect,
          child: ExcludeSemantics(
            child: Container(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _toggleFrontLayer,
                onVerticalDragUpdate: _handleDragUpdate,
                onVerticalDragEnd: _handleDragEnd,
                child: widget.frontHeading,
              ),
            ),
          ),
        ),
      );
    }

    return Stack(
      key: _backdropKey,
      children: layers,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: _buildStack);
  }
}
