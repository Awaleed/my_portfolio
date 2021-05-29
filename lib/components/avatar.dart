import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/size_config.dart';

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
                Parent(
                  style: ParentStyle()
                    ..circle()
                    ..margin(all: 10)
                    ..background.image(imageProvider: AssetImage('assets/images/my_avatar.jpg')),
                ),
                GradientAnimationWidget()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
