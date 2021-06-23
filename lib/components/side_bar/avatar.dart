import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import 'gradient_animation.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: SizedBox(
            height: SizeConfig.height(20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                GradientAnimationWidget(),
                IgnorePointer(
                  child: Parent(
                    style: ParentStyle()
                      ..circle()
                      ..margin(all: SizeConfig.height(20) * .02)
                      ..background.image(
                          imageProvider:
                              AssetImage('assets/images/my_avatar.jpg')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
