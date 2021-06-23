import 'dart:async';
import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

int currentlyHoveredTile = -10, tileCount = 0;

class WorkScreen extends StatefulWidget {
  const WorkScreen({Key? key}) : super(key: key);

  @override
  _WorkScreenState createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  final ran = Random();
  int row = 4;
  int col = 6;

  late List<List<_TileInfo>> twoDList;
  late Timer animationTimer;

  bool moveVertically = true;

  @override
  void initState() {
    super.initState();
    currentlyHoveredTile = -10;
    tileCount = 0;

    twoDList = List.generate(
      col + 2,
      (i) => List.generate(
        row + 2,
        (j) => _TileInfo(
          tileCount++,
          i - 1,
          j - 1,
          Colors.primaries[ran.nextInt(18)],
        ),
      ),
    );
    animationTimer = Timer.periodic(
      (5000 + ran.nextDouble() * 1000).ceil().milliseconds,
      // 300.milliseconds,
      (timer) async {
        // animateVertical(1, true);

        await Future.delayed((ran.nextDouble() * 5000).ceil().milliseconds);
        if (moveVertically)
          animateVertical(ran.nextInt(col), ran.nextBool());
        else
          animateHorizontal(ran.nextInt(row), ran.nextBool());
        setState(() {});

        moveVertically = !moveVertically;
        await Future.delayed(
          (500 + ran.nextDouble() * 1000).ceil().milliseconds,
        );

        if (moveVertically)
          animateVertical(ran.nextInt(col), ran.nextBool());
        else
          animateHorizontal(ran.nextInt(row), ran.nextBool());
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    animationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight / row;
          final width = constraints.maxWidth / col;
          return Stack(
            children: [
              ..._buildGrid(height, width),
              // Positioned(
              //   left: 20,
              //   bottom: 20,
              //   child: FloatingActionButton(
              //     onPressed: () async {
              //       // animateVertical(0, false);

              //       await Future.delayed(500.milliseconds);
              //     },
              //   ),
              // )
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildGrid(double height, double width) {
    final children = <Widget>[];

    for (var i = 0; i < twoDList.length; i++) {
      final row = twoDList[i];
      for (var j = 0; j < row.length; j++) {
        final tile = row[j];

        children.add(
          AnimatedPositioned(
            curve: Curves.easeOut,
            child: AnimatedTile(
              id: tile.id,
              colors: Colors.primaries,
            ),
            height: height,
            width: width,
            left: width * tile.dx,
            top: height * tile.dy,
            duration: tile.movingBack ? 0.milliseconds : 500.milliseconds,
          ),
        );
      }
    }
    return children;
  }

  void animateHorizontal(int rowIndex, bool forward) {
    for (var row in twoDList) {
      for (var tile in row) {
        if (tile.id == currentlyHoveredTile && tile.dy == rowIndex)
          return animateHorizontal(ran.nextInt(this.row), forward);
      }
    }
    setState(() {
      for (var row in twoDList) {
        for (var tile in row) {
          if (tile.dy == rowIndex) {
            tile.movingBack = false;

            if (forward)
              tile.dx++;
            else
              tile.dx--;
            if (tile.dx > this.col) {
              tile.dx = -1;
              tile.movingBack = true;
            } else if (tile.dx < -1) {
              tile.dx = this.col;
              tile.movingBack = true;
            }
          }
        }
      }
    });
  }

  void animateVertical(int columnIndex, bool forward) {
    for (var row in twoDList) {
      for (var tile in row) {
        if (tile.id == currentlyHoveredTile && tile.dx == columnIndex)
          return animateVertical(ran.nextInt(col), forward);
      }
    }
    setState(() {
      for (var row in twoDList) {
        for (var tile in row) {
          if (tile.dx == columnIndex) {
            tile.movingBack = false;

            if (forward)
              tile.dy++;
            else
              tile.dy--;
            if (tile.dy > this.row) {
              tile.dy = -1;
              tile.movingBack = true;
            } else if (tile.dy < -1) {
              tile.dy = this.row;
              tile.movingBack = true;
            }
          }
        }
      }
    });
  }
}

class _TileInfo {
  int id, dx, dy;
  Color color;
  bool movingBack;

  _TileInfo(
    this.id,
    this.dx,
    this.dy,
    this.color, {
    this.movingBack = false,
  });

  @override
  String toString() => '($dx, $dy)';
}

class AnimatedTile extends StatefulWidget {
  const AnimatedTile({Key? key, required this.colors, required this.id})
      : super(key: key);
  final int id;
  final List<Color> colors;

  @override
  _AnimatedTileState createState() => _AnimatedTileState();
}

class _AnimatedTileState extends State<AnimatedTile>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  late List<_AnimationInfo> animations;
  late int animationIndex, valueIndex;
  Timer? animationTimer;

  final ran = Random();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: 700.milliseconds,
    );
    animationController!.curve(Curves.easeOut);
    animationController!.addListener(() {
      if (animationController!.value >= .499 &&
          animationController!.value <= .501) {
        setState(() {
          valueIndex = ran.nextInt(widget.colors.length);
        });
      }
    });
    animations = [
      _AnimationInfo(
        tween: 0.0.tweenTo(pi),
        builder: (context, child, value) => Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(value),
          alignment: Alignment.center,
          child: child,
        ),
      ),
      _AnimationInfo(
        tween: (-1.0).tweenTo(1.0),
        builder: (context, child, value) {
          // print('value: ' + );
          return Opacity(
            opacity: sin(value).abs(),
            child: child,
          );
        },
      ),
    ];
    animationIndex = ran.nextInt(animations.length);
    valueIndex = ran.nextInt(widget.colors.length);
    animations[animationIndex].animate(animationController!);

    animationTimer = Timer.periodic(
      (5000 + ran.nextDouble() * 10000).ceil().milliseconds,
      (timer) async {
        await Future.delayed((ran.nextDouble() * 5000).ceil().milliseconds);
        if (animationController == null) return;
        if (widget.id != currentlyHoveredTile) {
          animationIndex = ran.nextInt(animations.length);
          animations[animationIndex].animate(animationController!);
          await animationController!.forward(from: 0);
        }
        animationController!.reset();
      },
    );
  }

  @override
  void dispose() {
    animationTimer?.cancel();
    animationController?.dispose();
    animationController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child = HoverAnimatedWidget(
      text: '${widget.id}',
      color: widget.colors[valueIndex],
      onTap: () {},
      onHover: () => setState(() => currentlyHoveredTile = widget.id),
      onHoverDismissed: () => setState(() => currentlyHoveredTile = -10),
    );
    // if (animationController.isCompleted) {
    //   return child;
    // } else {
    return AnimatedBuilder(
      // control: animationControl,
      animation: animations[animationIndex].animation,
      builder: (context, child) => animations[animationIndex].builder(
        context,
        child,
        animations[animationIndex].animation.value,
      ),
      child: child,
    );
    // }
  }
}

class HoverAnimatedWidget extends StatefulWidget {
  const HoverAnimatedWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
    required this.onHover,
    required this.onHoverDismissed,
  }) : super(key: key);
  final String text;
  final Color color;
  final VoidCallback onTap, onHover, onHoverDismissed;

  @override
  _HoverAnimatedWidgetState createState() => _HoverAnimatedWidgetState();
}

class _HoverAnimatedWidgetState extends State<HoverAnimatedWidget> {
  bool hovers = false;

  @override
  Widget build(BuildContext context) {
    final hoversStyle = ParentStyle()..scale(2);
    final normalStyle = ParentStyle()..scale(1);

    return ClipRRect(
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            hovers = true;
            widget.onHover();
          });
        },
        onExit: (event) {
          setState(() {
            hovers = false;
            widget.onHoverDismissed();
          });
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Parent(
              style: ParentStyle()
                ..add(hovers ? hoversStyle : normalStyle)
                ..animate(),
              child: Container(
                alignment: Alignment.center,
                color: widget.color,
                child: Text(widget.text),
                // child: IconButton(
                //   icon: Icon(Icons.play_circle),
                //   onPressed: () {
                //     // setState(() {
                //     // animationControl = CustomAnimationControl.playFromStart;
                //     // });
                //   },
                // ),
              ),
            ),
            IgnorePointer(
              ignoring: !hovers,
              child: AnimatedOpacity(
                opacity: hovers ? 1 : 0,
                duration: 300.milliseconds,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black54,
                  child: ElevatedButton(
                    child: Text('Show Details'),
                    onPressed: () {},
                  ),
                  // child: IconButton(
                  //   icon: Icon(Icons.play_circle),
                  //   onPressed: () {
                  //     // setState(() {
                  //     // animationControl = CustomAnimationControl.playFromStart;
                  //     // });
                  //   },
                  // ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AnimationInfo {
  final dynamic tween;
  late Animation _animation;

  void animate(AnimationController controller) =>
      _animation = tween.animate(controller);

  Animation get animation => _animation;
  final Widget Function(BuildContext, Widget?, dynamic) builder;

  _AnimationInfo({required this.tween, required this.builder});
}
