import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  _LogoWidgetState createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Tween tween;

  late Animation animation;

  int currentWord = 0;

  final ran = Random();

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: 1000.milliseconds);
    // animationController.addStatusListener(animationStatusListener);

    tween = .75.tweenTo(1.25);

    // tween = generateTween();

    animation = tween.animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      tween: (-pi / 2).tweenTo(0),
      duration: 500.milliseconds,
      curve: Curves.fastOutSlowIn,
      builder: (context, child, value) => Transform.rotate(
        angle: value,
        child: child,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildFittedBox(-.5, Colors.tealAccent),
            _buildFittedBox(.5, Colors.purple),
          ],
        ),
      ),
    );
  }

  FittedBox _buildFittedBox(double offset, Color color) {
    return FittedBox(
      child: Transform.translate(
        offset: Offset(offset, 0),
        child: Txt(
          'A',
          style: TxtStyle()
            ..textColor(color)
            ..fontWeight(FontWeight.w500),
        ),
      ),
    );
  }
}
