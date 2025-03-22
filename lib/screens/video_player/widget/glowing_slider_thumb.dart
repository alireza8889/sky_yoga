import 'package:flutter/material.dart';

class GlowingSliderThumb extends SliderComponentShape {
  final double thumbRadius;

  GlowingSliderThumb({this.thumbRadius = 12});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbRadius * 2, thumbRadius * 2);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final shadowPaint = Paint()
      ..color = const Color.fromRGBO(255, 255, 255, .5)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5);

    canvas.drawCircle(center, thumbRadius + 5, shadowPaint);

    final gradient = RadialGradient(
      colors: [Colors.white, Colors.white],
    ).createShader(
      Rect.fromCircle(
        center: center,
        radius: thumbRadius,
      ),
    );

    final glowPaint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, glowPaint);
  }
}

class StaticGlowingSliderThumb extends SliderComponentShape {
  final double thumbRadius;

  StaticGlowingSliderThumb({this.thumbRadius = 12});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbRadius * 2, thumbRadius * 2);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final shadowPaint = Paint()
      ..color = const Color.fromRGBO(255, 255, 255, 0.4)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8);

    canvas.drawCircle(center, thumbRadius + 5, shadowPaint);

    final gradient = RadialGradient(
      colors: [Colors.white, Colors.white],
    ).createShader(Rect.fromCircle(center: center, radius: thumbRadius));

    final glowPaint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, glowPaint);
  }
}
