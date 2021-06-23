import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class BouncingCharactersWidget extends StatelessWidget {
  BouncingCharactersWidget(
    this.text, {
    Key? key,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final style = this.style ??
        GoogleFonts.robotoMonoTextTheme().headline1?.copyWith(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            );
    return Row(
      children: List.from(text.characters)
          .map(
            (e) => AnimatedCharacterWidget(
              e,
              style: style,
            ),
          )
          .toList(),
    );
  }
}

class AnimatedCharacterWidget extends StatefulWidget {
  const AnimatedCharacterWidget(
    this.character, {
    Key? key,
    required this.style,
  }) : super(key: key);
  final String character;
  final TextStyle? style;

  @override
  _AnimatedCharacterWidgetState createState() =>
      _AnimatedCharacterWidgetState();
}

class _AnimatedCharacterWidgetState extends State<AnimatedCharacterWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late TimelineTween<_AnimatableProps> tween;

  late Animation<TimelineValue<_AnimatableProps>> animation;

  int currentWord = 0;

  final ran = Random();

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: 1000.milliseconds)
          ..curve(Curves.bounceInOut);

    tween = generateTween();

    animation = tween.animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Color get randomColor => Colors.primaries[ran.nextInt(18)];

  TimelineTween<_AnimatableProps> generateTween() {
    final color = randomColor;
    return TimelineTween<_AnimatableProps>()
      ..addScene(begin: 0.milliseconds, duration: 50.milliseconds)
          .animate(_AnimatableProps.yScaleFactor, tween: 1.0.tweenTo(0.7))
          .animate(_AnimatableProps.xScaleFactor, tween: 1.0.tweenTo(0.8))
      ..addScene(begin: 50.milliseconds, end: 200.milliseconds)
          .animate(_AnimatableProps.yScaleFactor, tween: 0.7.tweenTo(1.2))
          .animate(_AnimatableProps.xScaleFactor, tween: 0.8.tweenTo(1.2))
      ..addScene(begin: 200.milliseconds, end: 250.milliseconds)
          .animate(_AnimatableProps.yScaleFactor, tween: 1.2.tweenTo(1.0))
          .animate(_AnimatableProps.xScaleFactor, tween: 1.2.tweenTo(1.0))
      ..addScene(begin: 0.milliseconds, end: 250.milliseconds).animate(
          _AnimatableProps.color,
          tween: ColorTween(begin: widget.style?.color, end: color))
      ..addScene(begin: 750.milliseconds, end: 1000.milliseconds).animate(
          _AnimatableProps.color,
          tween: ColorTween(begin: color, end: widget.style?.color));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) async {
        await animationController.forward(from: 0);
      },
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.diagonal3Values(
              animation.value.get(_AnimatableProps.xScaleFactor),
              animation.value.get(_AnimatableProps.yScaleFactor),
              1.0,
            ),
            alignment: Alignment.center,
            child: Text(
              widget.character,
              style: widget.style?.copyWith(
                color: animation.value.get(_AnimatableProps.color),
              ),
            ),
          );
        },
      ),
    );
  }
}

enum _AnimatableProps { xScaleFactor, yScaleFactor, color }
