import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class AnimatedSlidingTextWidget extends StatefulWidget {
  const AnimatedSlidingTextWidget({
    Key? key,
    required this.phrases,
    this.prefixString,
    this.style,
  }) : super(key: key);

  final TextStyle? style;
  final String? prefixString;
  final List<String> phrases;

  @override
  _AnimatedSlidingTextWidgetState createState() =>
      _AnimatedSlidingTextWidgetState();
}

class _AnimatedSlidingTextWidgetState extends State<AnimatedSlidingTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    animationController = AnimationController(vsync: this, duration: 1.seconds);
    animationController.addListener(animationListener);
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void animationListener() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.offset + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Text('${widget.prefixString ?? ''}', style: widget.style),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ListWheelScrollView.useDelegate(
                  controller: scrollController,
                  itemExtent: constraints.maxHeight / 5,
                  childDelegate: ListWheelChildBuilderDelegate(
                    builder: (context, index) {
                      return Container(
                        // color: Colors.amber,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${widget.phrases[(index) % (widget.phrases.length)]}',
                                textAlign: TextAlign.start,
                                style: widget.style,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.005)
                    ..rotateX(-.1),
                  alignment: Alignment.topCenter,
                  child: Parent(
                    style: ParentStyle()
                      ..linearGradient(
                        colors: [
                          Colors.grey.shade900,
                          Colors.grey.shade900,
                          Colors.grey.shade900.withOpacity(.5),
                          Colors.grey.shade900.withOpacity(.25),
                        ],
                        stops: [0, .1, .2, .4],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                  ),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.005)
                    ..rotateX(.1),
                  alignment: Alignment.bottomCenter,
                  child: Parent(
                    style: ParentStyle()
                      ..linearGradient(
                        colors: [
                          Colors.grey.shade900,
                          Colors.grey.shade900,
                          Colors.grey.shade900.withOpacity(.5),
                          Colors.grey.shade900.withOpacity(.25),
                        ],
                        stops: [0, .1, .2, .4],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
