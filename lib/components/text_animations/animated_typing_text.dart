import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class AnimatedTypingTextWidget extends StatefulWidget {
  const AnimatedTypingTextWidget({
    Key? key,
    required this.phrases,
    this.prefixString,
    this.style,
  }) : super(key: key);

  final TextStyle? style;
  final String? prefixString;
  final List<String> phrases;

  @override
  _AnimatedTypingTextWidgetState createState() => _AnimatedTypingTextWidgetState();
}

class _AnimatedTypingTextWidgetState extends State<AnimatedTypingTextWidget> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Tween tween;

  late Animation animation;

  int currentWord = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: 1.seconds);
    animationController.addStatusListener(animationStatusListener);
    setWordTween(currentWord);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void setWordTween(int index) {
    tween = 0.tweenTo(widget.phrases[index].length);
    animation = tween.animate(animationController);
    animationController.forward(from: 0);
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      if (widget.phrases.length > 1) currentWord = (currentWord + 1) % (widget.phrases.length);
      setState(() {
        setWordTween(currentWord);
      });
    } else if (status == AnimationStatus.completed) {
      Future.delayed(1.seconds).then(
        (value) => animationController.animateBack(0, duration: 300.milliseconds),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Text(
          '${widget.prefixString ?? ''}${widget.phrases[currentWord].substring(0, animation.value)}',
          style: widget.style,
        );
      },
    );
  }
}
