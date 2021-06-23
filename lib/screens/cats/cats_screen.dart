import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

class _TileInfo {
  int id, parentId, dx, dy;
  Color color;
  bool expanded;
  String value;
  // List<String> values;

  _TileInfo({
    required this.id,
    required this.parentId,
    required this.dx,
    required this.dy,
    required this.color,
    required this.value,
    // required this.values,
    this.expanded = false,
  });

  @override
  String toString() => '($dx, $dy)';
}

final ran = Random();
int row = 5;
int col = 5;

int tileCount = 0;

final list = ValueNotifier<List<List<_TileInfo>>?>(null);

class CatsScreen extends StatefulWidget {
  const CatsScreen({Key? key}) : super(key: key);

  @override
  _CatsScreenState createState() => _CatsScreenState();
}

class _CatsScreenState extends State<CatsScreen> {
  late List<List<_TileInfo>> twoDList;

  List<List<_TileInfo>> get listToShow => list.value ?? twoDList;

  @override
  void initState() {
    super.initState();

    list.addListener(() {
      setState(() {});
    });
    tileCount = 0;

    twoDList = List.filled(row, []);

    for (var y = 0; y < row; y++) {
      for (var x = 0; x < col /* - y */; x++) {
        twoDList[y].add(
          _TileInfo(
            parentId: 0,
            id: tileCount++,
            dx: x,
            dy: y,
            color: Colors.primaries[ran.nextInt(18)],
            value: '$tileCount, ($x, $y)',
            // values: List.filled(10, ('($x, $y)')),
          ),
        );
      }
    }
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

    for (var i = 0; i < listToShow.length; i++) {
      final row = listToShow[i];
      for (var j = 0; j < row.length; j++) {
        final tile = row[j];

        children.add(
          AnimatedPositioned(
            curve: Curves.easeOut,
            child: AnimatedTile(
              data: tile,
              colors: Colors.primaries,
            ),
            height: height,
            width: width,
            left: width * tile.dx,
            top: height * tile.dy,
            duration: 500.milliseconds,
          ),
        );
      }
    }
    return children;
  }

  // void animateHorizontal(int rowIndex, bool forward) {
  //   for (var row in twoDList) {
  //     for (var tile in row) {
  //       if (tile.id == currentlyHoveredTile && tile.dy == rowIndex)
  //         return animateHorizontal(ran.nextInt(this.row), forward);
  //     }
  //   }
  //   setState(() {
  //     for (var row in twoDList) {
  //       for (var tile in row) {
  //         if (tile.dy == rowIndex) {
  //           // tile.movingBack = false;

  //           if (forward)
  //             tile.dx++;
  //           else
  //             tile.dx--;
  //           if (tile.dx > this.col) {
  //             tile.dx = -1;
  //             // tile.movingBack = true;
  //           } else if (tile.dx < -1) {
  //             tile.dx = this.col;
  //             // tile.movingBack = true;
  //           }
  //         }
  //       }
  //     }
  //   });
  // }

  // void animateVertical(int columnIndex, bool forward) {
  //   for (var row in twoDList) {
  //     for (var tile in row) {
  //       if (tile.id == currentlyHoveredTile && tile.dx == columnIndex)
  //         return animateVertical(ran.nextInt(col), forward);
  //     }
  //   }
  //   setState(() {
  //     for (var row in twoDList) {
  //       for (var tile in row) {
  //         if (tile.dx == columnIndex) {
  //           // tile.movingBack = false;

  //           if (forward)
  //             tile.dy++;
  //           else
  //             tile.dy--;
  //           if (tile.dy > this.row) {
  //             tile.dy = -1;
  //             // tile.movingBack = true;
  //           } else if (tile.dy < -1) {
  //             tile.dy = this.row;
  //             // tile.movingBack = true;
  //           }
  //         }
  //       }
  //     }
  //   });
  // }

}

class AnimatedTile extends StatefulWidget {
  const AnimatedTile({Key? key, required this.colors, required this.data}) : super(key: key);
  final _TileInfo data;
  final List<Color> colors;

  @override
  _AnimatedTileState createState() => _AnimatedTileState();
}

class _AnimatedTileState extends State<AnimatedTile> with SingleTickerProviderStateMixin {
  final ran = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoverAnimatedWidget(
      text: '${widget.data.value}',
      color: widget.data.expanded ? Colors.white : widget.data.color,
      onTap: () {
        if (widget.data.expanded) {
          widget.data.expanded = false;
          list.value = null;
        } else {
          final newList = List<List<_TileInfo>>.filled(row, []);
          for (var y = 0; y < row; y++) {
            for (var x = 0; x < col /* - y */; x++) {
              if (widget.data.dx == x && widget.data.dy == y) {
                newList[y].add(widget.data..expanded = true);
              } else {
                newList[y].add(
                  _TileInfo(
                    parentId: 0,
                    id: tileCount++,
                    dx: x,
                    dy: y,
                    color: Colors.primaries[ran.nextInt(18)],
                    value: '${widget.data.id + 1}, ($x, $y)',
                    // values: List.filled(10, ('($x, $y)')),
                  ),
                );
              }
            }
          }
          list.value = newList;
        }
      },

      // onHover: () => setState(() => currentlyHoveredTile = widget.id),
      // onHoverDismissed: () => setState(() => currentlyHoveredTile = -10),
    );
    // if (animationController.isCompleted) {
    //   return child;
    // } else {
    //  child;
    // }
  }
}

class HoverAnimatedWidget extends StatefulWidget {
  const HoverAnimatedWidget({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  _HoverAnimatedWidgetState createState() => _HoverAnimatedWidgetState();
}

class _HoverAnimatedWidgetState extends State<HoverAnimatedWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        alignment: Alignment.center,
        color: widget.color,
        child: ElevatedButton(
          onPressed: widget.onTap,
          child: Text(widget.text),
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
    );
  }
}
