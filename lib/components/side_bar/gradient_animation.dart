import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class GradientAnimationWidget extends StatefulWidget {
  GradientAnimationWidget({Key? key}) : super(key: key);

  @override
  _GradientAnimationWidgetState createState() => _GradientAnimationWidgetState();
}

class _GradientAnimationWidgetState extends State<GradientAnimationWidget> {
  CustomAnimationControl animationState = CustomAnimationControl.stop;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          animationState = CustomAnimationControl.loop;
        });
      },
      onExit: (event) {
        setState(() {
          animationState = CustomAnimationControl.stop;
        });
      },
      child: CustomAnimation<double>(
        control: animationState,
        tween: 0.0.tweenTo(pi * 2),
        duration: 10.seconds,
        builder: (context, child, value) => Transform.rotate(
          angle: value,
          child: child,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10000),
            gradient: LinearGradient(
              colors: Colors.primaries,
            ),
          ),
        ),
      ),
    );
  }
}
