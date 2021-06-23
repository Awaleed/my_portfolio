import 'package:flutter/material.dart';

import '../../components/animated_stars.dart';
import 'components/welcome_text.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) => MousePainter.currentMouseOffset = event.localPosition,
      child: Container(
        color: Colors.grey.shade900,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            AnimatedStarsWidget(),
            WelcomeTextWidget(),
          ],
        ),
      ),
    );
  }
}
