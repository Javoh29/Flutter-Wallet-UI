import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/painting.dart';

class CornerDecoration extends Decoration {
  final bool fillLeft;
  final bool fillTop;
  final bool fillRight;
  final bool fillBottom;
  final double strokeWidth;
  final Color strokeColor;
  final EdgeInsets insets;
  final double position;
  final double cornerSide;

  CornerDecoration({
    this.fillLeft = false,
    this.fillTop = false,
    this.fillRight = false,
    this.fillBottom = false,
    this.strokeWidth = 3,
    @required this.strokeColor,
    EdgeInsets insets,
    this.position = 0.5,
    this.cornerSide = 16,
  }) : insets = insets ?? EdgeInsets.all(strokeWidth);

  @override
  BoxPainter createBoxPainter([onChanged]) =>
      _CornerBoxPainter(fillLeft, fillTop, fillRight, fillBottom, strokeWidth, strokeColor, insets, position, cornerSide);

  @override
  EdgeInsetsGeometry get padding => insets;
}

class _CornerBoxPainter extends BoxPainter {
  final bool fillLeft;
  final bool fillTop;
  final bool fillRight;
  final bool fillBottom;
  final double strokeWidth;
  final EdgeInsets insets;
  final double position;
  final double cornerSide;
  Paint _p;
  Path _path;
  Rect _rect;

  _CornerBoxPainter(this.fillLeft, this.fillTop, this.fillRight, this.fillBottom, this.strokeWidth, strokeColor, this.insets, this.position, this.cornerSide) {
    _p = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..strokeWidth = strokeWidth;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var baseRect = offset & configuration.size;
    if (baseRect != _rect) {
      print('new size: $baseRect');
      _rect = baseRect;

      var a = baseRect.deflate(strokeWidth / 2);
      var b = insets.deflateRect(baseRect).inflate(strokeWidth / 2);
      var rect = Rect.lerp(a, b, position);

      _path = Path()
        ..moveTo(rect.topLeft.dx, rect.topLeft.dy);

      var horizontalOffsets = [
        Offset(cornerSide, 0), Offset(rect.width - 2 * cornerSide, 0), Offset(rect.width, 0),
      ];
      var verticalOffsets = [
        Offset(0, cornerSide), Offset(0, rect.height - 2 * cornerSide), Offset(0, rect.height),
      ];

      _buildPathSide(fillTop, horizontalOffsets, false);
      _buildPathSide(fillRight, verticalOffsets, false);
      _buildPathSide(fillBottom, horizontalOffsets, true);
      _buildPathSide(fillLeft, verticalOffsets, true);
    }
    canvas.drawPath(_path, _p);
  }

  void _buildPathSide(bool fillSide, List<Offset> offsets, bool reverse) {
    if (reverse) offsets = offsets.map((o) => -o).toList();
    if (fillSide) _path
      ..relativeLineTo(offsets[2].dx, offsets[2].dy);
    else _path
      ..relativeLineTo(offsets[0].dx, offsets[0].dy)
      ..relativeMoveTo(offsets[1].dx, offsets[1].dy)
      ..relativeLineTo(offsets[0].dx, offsets[0].dy);
  }
}

class ConcaveDecoration extends Decoration {
  final ShapeBorder shape;
  final double depression;
  final List<Color> colors;

  ConcaveDecoration({
    @required this.shape,
    @required this.depression,
    this.colors,
  }) : assert(shape != null), assert(depression >= 0), assert(colors == null || colors.length == 2);

  @override
  BoxPainter createBoxPainter([onChanged]) => _ConcaveDecorationPainter(shape, depression, colors);

  @override
  EdgeInsetsGeometry get padding => shape.dimensions;
}

class _ConcaveDecorationPainter extends BoxPainter {
  ShapeBorder shape;
  double depression;
  List<Color> colors;

  _ConcaveDecorationPainter(this.shape, this.depression, this.colors) {
    colors ??= [Colors.black87, Colors.white];
  }

  @override
  void paint(ui.Canvas canvas, ui.Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size;
    final shapePath = shape.getOuterPath(rect);

    final delta = 16 / rect.longestSide;
    final stops = [0.5 - delta, 0.5 + delta];

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect.inflate(depression * 2))
      ..addPath(shapePath, Offset.zero);
    canvas.save();
    canvas.clipPath(shapePath);

    final paint = Paint()..maskFilter = MaskFilter.blur(BlurStyle.normal, depression);
    final clipSize = rect.size.aspectRatio > 1? Size(rect.width, rect.height / 2) : Size(rect.width / 2, rect.height);
    for (final alignment in [Alignment.topLeft, Alignment.bottomRight]) {
      final shaderRect = alignment.inscribe(Size.square(rect.longestSide), rect);
      paint..shader = ui.Gradient.linear(shaderRect.topLeft, shaderRect.bottomRight, colors, stops);

      canvas.save();
      canvas.clipRect(alignment.inscribe(clipSize, rect));
      canvas.drawPath(path, paint);
      canvas.restore();
    }
    canvas.restore();
  }
}