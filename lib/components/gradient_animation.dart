import 'dart:async';
import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class GradientAnimationWidget extends StatefulWidget {
  GradientAnimationWidget({Key? key}) : super(key: key);

  @override
  _GradientAnimationWidgetState createState() => _GradientAnimationWidgetState();
}

class _GradientAnimationWidgetState extends State<GradientAnimationWidget> {
  final ran = Random();

  final colors = List<Color>.from(Colors.primaries);
  // late Timer animationTimer;

  @override
  void initState() {
    super.initState();
    // animationTimer = Timer.periodic(
    //   500.milliseconds,
    //   (timer) {
    //     setState(() {
    //       colors.insert(0, colors.removeLast());
    //       // print(colors);
    //     });
    //   },
    // );
  }

  @override
  void dispose() {
    super.dispose();
    // animationTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ObjectKey(colors),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
    );
    // return MirrorAnimation<double>(
    //   builder: (context, child, value) {
    //     return Container(
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           colors: ,
    //         ),
    //       ),
    //     );
    //     return Parent(
    //       style: ParentStyle()
    //         ..linearGradient(
    //           colors: Colors.primaries,

    //           // stops: List.generate(Colors.primaries.length, (index) => ran.nextDouble()),
    //         ),
    //     );
    //   },
    //   tween: 0.0.tweenTo(360.0),
    // );
  }
}
