import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ASTooltip extends StatefulWidget {
  final Widget child;
  final String? text;
  final Widget? content;
  final int milliseconds;
  final Color color;
  final ArrowAlign arrowAlign;
  final bool defaultShow;
  final Duration? animateDuration;
  final double offsetLeft;
  final double offsetRight;
  final double offsetTop;
  final double offsetBottom;
  final void Function(ASTooltipState)? initialCallback;
  final void Function()? dismissCallback;
  final bool showBackdrop;
  final double backdropOpacity;
  final double? width;
  const ASTooltip({
    super.key,
    required this.child,
    this.text,
    this.content,
    this.milliseconds = 3000,
    this.color = Colors.black,
    this.arrowAlign = ArrowAlign.topRight,
    this.defaultShow = true,
    this.animateDuration,
    this.offsetLeft = 0,
    this.offsetRight = 0,
    this.offsetTop = 0,
    this.offsetBottom = 0,
    this.initialCallback,
    this.dismissCallback,
    this.showBackdrop = false,
    this.backdropOpacity = .2,
    this.width,
  });
//: assert(text != null && content != null, "text and content must one")
  @override
  State<ASTooltip> createState() => ASTooltipState();
}

/// _ASTooltipState
class ASTooltipState extends State<ASTooltip> {
  final tag = "ASTooltipState";
  OverlayEntry? _entry;
  late final bool _disableTap = widget.milliseconds == 0 ? true : false;
  Timer? timer;
  Widget tooltipWidget = const SizedBox();
  final layerLink = LayerLink();
  final angleWidth = 15.0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_disableTap && widget.defaultShow) {
        show(context);
      }
    });
    initContentWidget();
    widget.initialCallback?.call(this);
    super.initState();
  }

  @override
  void dispose() {
    hide();
    try {
      GestureBinding.instance.pointerRouter
          .removeGlobalRoute(_handlePointerEvent);
    } catch (e) {
      //ignore e
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _disableTap ? null : () => show(context),
      child: CompositedTransformTarget(
        link: layerLink,
        child: widget.child,
      ),
    );
  }

  void _handlePointerEvent(PointerEvent event) {
    if (event is PointerUpEvent) {
      hide();
    }
  }

  void initContentWidget() {
    if (widget.text != null) {
      tooltipWidget = Text(
        widget.text!,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          height: 18 / 14,
        ),
      );
    } else if (widget.content != null) {
      tooltipWidget = widget.content!;
    }

    tooltipWidget = Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: widget.width,
        padding: const EdgeInsets.all(10),
        child: tooltipWidget,
      ),
    );
  }

  void show(
    BuildContext context, {
    bool dimiss = true,
  }) {
    if (!mounted) return;
    try {
      if (dimiss) {
        GestureBinding.instance.pointerRouter
            .addGlobalRoute(_handlePointerEvent);
      }
    } catch (e) {
      //ignore e
    }
    _entry = OverlayEntry(
      maintainState: true,
      builder: _buildTooltipWidget,
    );
    Overlay.of(context).insert(_entry!);
    _addTimer();
  }

  void hide() {
    timer?.cancel();
    timer = null;
    if (mounted) {
      _entry?.remove();
      _entry = null;
    }
    widget.dismissCallback?.call();
  }

  Widget _buildTooltipWidget(BuildContext _) {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Size childSize = box.size;
    final Size tooltipSize = measureWidget(tooltipWidget);
    Offset offset = const Offset(0, 0);
    double x = 0;
    double y = 0;

    bool isArrowTop = widget.arrowAlign.isTopCenter ||
        widget.arrowAlign.isTopLeft ||
        widget.arrowAlign.isTopRight;

    bool isArrowBottom = widget.arrowAlign.isBottomCenter ||
        widget.arrowAlign.isBottomLeft ||
        widget.arrowAlign.isBottomRight;

    bool isArrowRight = widget.arrowAlign.isRightBottom ||
        widget.arrowAlign.isRightCenter ||
        widget.arrowAlign.isRightTop;

    bool isArrowLeft = widget.arrowAlign.isLeftBottom ||
        widget.arrowAlign.isLeftCenter ||
        widget.arrowAlign.isLeftTop;

    bool isArrowHorizontal = isArrowRight || isArrowLeft;

    bool isArrowVertical = isArrowTop || isArrowBottom;

    if (isArrowVertical) {
      if (isArrowTop) {
        y = childSize.height + angleWidth / 2;
      }
      if (isArrowBottom) {
        y = -(tooltipSize.height + angleWidth / 2);
      }

      if (widget.arrowAlign.isTopCenter || widget.arrowAlign.isBottomCenter) {
        x = (tooltipSize.width > childSize.width
                ? -(tooltipSize.width - childSize.width)
                : childSize.width - tooltipSize.width) /
            2;
      }
      if (widget.arrowAlign.isTopLeft || widget.arrowAlign.isBottomLeft) {
        x = (childSize.width / 2) - angleWidth - angleWidth / 2;
      }
      if (widget.arrowAlign.isTopRight || widget.arrowAlign.isBottomRight) {
        x = -(tooltipSize.width - childSize.width / 2) +
            angleWidth +
            angleWidth / 2;
      }
    }
    if (isArrowHorizontal) {
      if (isArrowLeft) {
        x = childSize.width + angleWidth / 2;
      }
      if (isArrowRight) {
        x = -(tooltipSize.width + angleWidth / 2);
      }
      if (widget.arrowAlign.isLeftBottom || widget.arrowAlign.isRightBottom) {
        y = -(tooltipSize.height - childSize.height / 2) +
            angleWidth +
            angleWidth / 2;
      }
      if (widget.arrowAlign.isLeftCenter || widget.arrowAlign.isRightCenter) {
        y = (tooltipSize.height > childSize.height
                ? -(tooltipSize.height - childSize.height)
                : childSize.height - tooltipSize.height) /
            2;
      }
      if (widget.arrowAlign.isLeftTop || widget.arrowAlign.isRightTop) {
        y = (childSize.height / 2) - angleWidth - angleWidth / 2;
      }
    }

    offset = Offset(x, y);
    Widget overlay = _buildOverlay(offset);
    if (widget.showBackdrop) {
      overlay = Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(widget.backdropOpacity),
          ),
          Positioned(
            width: childSize.width,
            height: childSize.height,
            child: CompositedTransformFollower(
              link: layerLink,
              showWhenUnlinked: false,
              child: widget.child,
            ),
          ),
          overlay,
        ],
      );
    }
    if (widget.animateDuration == null) {
      return overlay;
    }
    return overlay.animate().fadeIn(duration: widget.animateDuration);
  }

  Widget _buildOverlay(Offset offset) {
    Widget overlay = Positioned(
      left: 0,
      top: 0,
      child: CompositedTransformFollower(
        link: layerLink,
        showWhenUnlinked: false,
        offset: offset,
        child: CustomPaint(
          painter: MyCustomPainter(
            triangleAlign: widget.arrowAlign,
            angleWidth: angleWidth,
            radius: 15,
            color: widget.color,
          ),
          child: tooltipWidget,
        ),
      ),
    );
    return overlay;
  }

  void _addTimer() {
    if (_disableTap) return;
    timer = null;
    timer = Timer(Duration(milliseconds: widget.milliseconds), () {
      hide();
    });
  }
}

class PaintTriangle extends CustomPainter {
  final Color backgroundColor;
  final Color borderColor;

  final double borderThickness;

  PaintTriangle({
    required this.backgroundColor,
    required this.borderColor,
    this.borderThickness = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height;
    final x = size.width;

    final paint = Paint()..color = backgroundColor;
    final path = Path()
      ..moveTo(0, y)
      ..lineTo((x / 2), (y / y))
      ..lineTo(x, y);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MyCustomPainter extends CustomPainter {
  final ArrowAlign triangleAlign;
  final ArrowAlign roundedAlign;
  final double radius;
  final double angleWidth;
  final Color color;
  MyCustomPainter({
    this.triangleAlign = ArrowAlign.none,
    this.roundedAlign = ArrowAlign.none,
    this.radius = 10,
    this.angleWidth = 10,
    this.color = Colors.red,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      // ..shader = const LinearGradient(
      //   begin: Alignment.topCenter,
      //   end: Alignment.bottomCenter,
      //   colors: [
      //     Colors.red,
      //     Colors.black,
      //   ],
      // ).createShader(
      //   Rect.fromCenter(
      //     center: Offset(width / 2, height / 2),
      //     width: width,
      //     height: height,
      //   ),
      // )
      ..strokeWidth = 1;

    final path = Path();
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    /// build top arrow
    _buildTopArrow(path, width);

    path.lineTo(width - radius, 0);

    path.quadraticBezierTo(width, 0, width, radius);

    /// build right arrow
    _buildRightArrow(path, width, height);

    path.lineTo(width, height - radius);

    path.quadraticBezierTo(width, height, width - radius, height);

    /// build bottom arrow
    _buildBottomArrow(path, width, height);

    path.lineTo(radius, height);

    path.quadraticBezierTo(0, height, 0, height - radius);

    /// build left arrow
    _buildLeftArrow(path, height);

    path.close();
    canvas.drawPath(path, paint);
  }

  /// build bottom arrow position
  void _buildBottomArrow(Path path, double width, double height) {
    /// bottom right
    if (triangleAlign.isBottomRight) {
      path.lineTo(width - radius - angleWidth / 2, height + angleWidth / 2);
      path.lineTo(width - radius - angleWidth, height);
    }

    /// bottom center
    if (triangleAlign.isBottomCenter) {
      path.lineTo(width / 2 + angleWidth / 2, height);
      path.lineTo(width / 2, height + angleWidth / 2);
      path.lineTo(width / 2 - angleWidth / 2, height);
    }

    /// bottom left
    if (triangleAlign.isBottomLeft) {
      path.lineTo(radius + angleWidth, height);
      path.lineTo(radius + angleWidth / 2, height + angleWidth / 2);
      path.lineTo(radius, height);
    }
  }

  /// build left arrow position
  void _buildLeftArrow(Path path, double height) {
    /// left bottom
    if (triangleAlign.isLeftBottom) {
      path.lineTo(-angleWidth / 2, height - radius - angleWidth / 2);
      path.lineTo(0, height - radius - angleWidth);
    }

    /// left center
    if (triangleAlign.isLeftCenter) {
      path.lineTo(0, height / 2 + angleWidth / 2);
      path.lineTo(-angleWidth / 2, height / 2);
      path.lineTo(0, height / 2 - angleWidth / 2);
    }

    /// left top
    if (triangleAlign.isLeftTop) {
      path.lineTo(0, radius + angleWidth);
      path.lineTo(-angleWidth / 2, radius + angleWidth / 2);
      path.lineTo(0, radius);
    }
  }

  /// build top arrow position
  void _buildTopArrow(Path path, double width) {
    if (triangleAlign.isTopLeft) {
      path.lineTo(radius + angleWidth / 2, -(angleWidth / 2));
      path.lineTo(radius + angleWidth, 0);
    }

    /// 上中
    if (triangleAlign.isTopCenter) {
      path.lineTo(width / 2 - angleWidth / 2, 0);
      path.lineTo(width / 2, -(angleWidth / 2));
      path.lineTo(width / 2 + angleWidth / 2, 0);
    }

    if (roundedAlign.isTopCenter) {
      /// 圆弧指示器
      double r = 20;
      double w = 40;
      double rr = 0.8;
      double lrr = 3;
      path.lineTo(width / 2 - w / 2 - r, 0);
      path.quadraticBezierTo(
        width / 2 - w / 2,
        0,
        width / 2 - w / 2,
        -w / lrr,
      );

      path.quadraticBezierTo(
        width / 2 - w / 2,
        -w * rr,
        width / 2,
        -w * rr,
      );

      path.quadraticBezierTo(
        width / 2 + w / 2,
        -w * rr,
        width / 2 + w / 2,
        -w / lrr,
      );

      path.quadraticBezierTo(
        width / 2 + w / 2,
        0,
        width / 2 + w,
        0,
      );
    }
    if (triangleAlign.isTopRight) {
      path.lineTo(width - radius - angleWidth, 0);
      path.lineTo(width - radius - angleWidth / 2, -(angleWidth / 2));
    }
  }

  /// build right arrow position
  void _buildRightArrow(Path path, double width, double height) {
    /// right top
    if (triangleAlign.isRightTop) {
      path.lineTo(width + angleWidth / 2, radius + angleWidth / 2);
      path.lineTo(width, radius + angleWidth);
    }

    /// right center
    if (triangleAlign.isRightCenter) {
      path.lineTo(width, height / 2 - angleWidth / 2);
      path.lineTo(width + angleWidth / 2, height / 2);
      path.lineTo(width, height / 2 + angleWidth / 2);
    }

    /// right bottom
    if (triangleAlign.isRightBottom) {
      path.lineTo(width, height - radius - angleWidth);
      path.lineTo(width + angleWidth / 2, height - radius - angleWidth / 2);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

enum ArrowAlign {
  none,
  topLeft,
  topCenter,
  topRight,
  rightTop,
  rightCenter,
  rightBottom,
  bottomRight,
  bottomCenter,
  bottomLeft,
  leftBottom,
  leftCenter,
  leftTop;

  bool get isTopLeft => this == topLeft;
  bool get isTopCenter => this == topCenter;
  bool get isTopRight => this == topRight;

  bool get isRightTop => this == rightTop;
  bool get isRightCenter => this == rightCenter;
  bool get isRightBottom => this == rightBottom;

  bool get isBottomRight => this == bottomRight;
  bool get isBottomCenter => this == bottomCenter;
  bool get isBottomLeft => this == bottomLeft;

  bool get isLeftBottom => this == leftBottom;
  bool get isLeftCenter => this == leftCenter;
  bool get isLeftTop => this == leftTop;
}

Size measureWidget(Widget widget) {
  final PipelineOwner pipelineOwner = PipelineOwner();
  final MeasurementView rootView = pipelineOwner.rootNode = MeasurementView();
  final BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());
  final RenderObjectToWidgetElement<RenderBox> element =
      RenderObjectToWidgetAdapter<RenderBox>(
    container: rootView,
    debugShortDescription: '[root]',
    child: widget,
  ).attachToRenderTree(buildOwner);
  try {
    rootView.scheduleInitialLayout();
    pipelineOwner.flushLayout();
    return rootView.size;
  } finally {
    // Clean up.
    element.update(RenderObjectToWidgetAdapter<RenderBox>(container: rootView));
    buildOwner.finalizeTree();
  }
}

class MeasurementView extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  @override
  void performLayout() {
    assert(child != null);
    child!.layout(const BoxConstraints(), parentUsesSize: true);
    size = child!.size;
  }

  @override
  void debugAssertDoesMeetConstraints() => true;
}
