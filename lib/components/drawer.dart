import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/size_config.dart';

import 'avatar.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()
        ..background.color(Colors.deepPurple)
        ..padding(all: 5)
        ..width(SizeConfig.width(20)),
      child: Column(
        children: [
          AvatarWidget(),
        ],
      ),
    );
  }
}
