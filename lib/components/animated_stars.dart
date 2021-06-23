import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import '../config/app_colors.dart';

class AnimatedStarsWidget extends StatelessWidget {
  const AnimatedStarsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoopAnimation(
      tween: 0.tweenTo(1),
      builder: (context, child, value) => CustomPaint(
        painter: MousePainter(),
      ),
    );
  }
}

class MousePainter extends CustomPainter {
  final ran = Random();

  static Offset? currentMouseOffset;
  static List<Vector3>? points;

  Vector3 generateRandomPoint() {
    return Vector3(
      ran.nextDouble(),
      ran.nextDouble(),
      ran.nextDouble(),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    // print('X: ${calculateXSpeed(size)}, Y: ${calculateYSpeed(size)}');

    if (points == null) {
      points = List.generate(
        1000,
        (index) => generateRandomPoint(),
      );
    }

    if (currentMouseOffset == null) {
      currentMouseOffset =
          Offset(ran.nextDouble() * size.width, ran.nextDouble() * size.height);
    }

    final paint = Paint()..color = kAppGrey;

    for (var i = 0; i < points!.length; i++) {
      var point = points![i];
      if (point.dy > 1) {
        points![i] = Vector3(point.dx, 0, point.dz);
      } else if (point.dy < 0) {
        points![i] = Vector3(point.dx, 1, point.dz);
      } else if (point.dx > 1) {
        points![i] = Vector3(0, point.dy, point.dz);
      } else if (point.dx < 0) {
        points![i] = Vector3(1, point.dy, point.dz);
      }
      points![i] = points![i].translate(
        calculateXSpeed(size) * points![i].dz,
        calculateYSpeed(size) * points![i].dz,
        0,
      );

      point = points![i].translate(
        points![i].dx * size.width,
        points![i].dy * size.height,
        0,
      );
      canvas.drawCircle(point.offset, 2 * point.dz, paint);
    }

    // final painter = TextPainter(
    //   text: TextSpan(
    //     text: '$currentMouseOffset',
    //     style: GoogleFonts.roboto(),
    //   ),
    //   textDirection: TextDirection.ltr,
    // );
    // painter.layout();
    // painter.paint(canvas, currentMouseOffset);

    // canvas.
  }

  double calculateXSpeed(Size size) {
    final halfScreen = size / 2;
    return ((currentMouseOffset!.dx / halfScreen.width) - 1) * .002;
  }

  double calculateYSpeed(Size size) {
    final halfScreen = size / 2;
    return ((currentMouseOffset!.dy / halfScreen.height) - 1) * .002;
  }

  @override
  bool shouldRepaint(MousePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MousePainter oldDelegate) => false;
}

class Vector3 {
  double dx, dy, dz;
  Vector3(
    this.dx,
    this.dy,
    this.dz,
  );

  Offset get offset => Offset(dx, dy);
  Vector3 translate(double translateX, double translateY, double translateZ) =>
      Vector3(
        dx + translateX,
        dy + translateY,
        dz + translateZ,
      );
}
