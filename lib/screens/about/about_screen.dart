import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components/text_animations/bouncing_characters.dart';
import 'package:my_portfolio/utils/size_config.dart';

import '../../components/animated_stars.dart';
import '../../components/text_animations/animated_sliding_text.dart';
import '../../config/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()
        ..background.image(
          imageProvider: AssetImage('assets/images/about_me.jpg'),
          fit: BoxFit.cover,
        ), // color: Colors.grey.shade900,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade900,
              Colors.grey.shade900.withOpacity(0.95),
              Colors.grey.shade900.withOpacity(0.85),
              Colors.grey.shade900.withOpacity(0.8),
              Colors.grey.shade900.withOpacity(0.75),
              Colors.grey.shade900,
            ],
            stops: [0.0, 0.35, 0.45, 0.5, 0.6, 1.0],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BouncingCharactersWidget('My, Myself & I'),
                    SizedBox(height: 20),
                    Txt(
                      'I’m a Front-End Developer located in Poland. I have a serious passion for UI effects, animations and creating intuitive, dynamic user experiences.',
                      style: TxtStyle()
                        // ..letterSpacing(3)
                        ..textColor(Colors.white)
                        ..fontWeight(FontWeight.w100)
                        ..fontSize(20),
                    ),
                    SizedBox(height: 20),
                    Txt(
                      'Well-organised person, problem solver, independent employee with high attention to detail. Fan of MMA, outdoor activities, TV series and English literature. A family person and father of two fractious boys,',
                      style: TxtStyle()
                        // ..letterSpacing(3)
                        ..textColor(Colors.white)
                        ..fontWeight(FontWeight.w100)
                        ..fontSize(20),
                    ),
                    SizedBox(height: 20),
                    Txt(
                      'Interested in the entire frontend spectrum and working on ambitious projects with positive people.',
                      style: TxtStyle()
                        // ..letterSpacing(3)
                        ..textColor(Colors.white)
                        ..fontWeight(FontWeight.w100)
                        ..fontSize(20),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      child: Text('Let’s make something special.'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: SizeConfig.height(50),
                child: AnimatedSlidingTextWidget(
                  style: GoogleFonts.robotoMonoTextTheme().headline1?.copyWith(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                  prefixString: 'My Skills, ',
                  phrases: ['Flutter', 'Dart', 'Server Side Dev'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Vector3> points = [
  Vector3(0.5, 0.5, 0.5),
];

class SpherePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final count = 10;
    // var phi = pi * (3.0 - sqrt(5.0)); // golden angle in radians

    // for (var i = 0; i < 20; i++) {
    //   final y = 1 - (i / (count - 1)) * 2; // y goes from 1 to -1
    //   final radius = sqrt(1 - y * y); // radius at y

    //   final theta = phi * i; // golden angle increment

    //   final x = cos(theta) * radius;
    //   final z = sin(theta) * radius;

    //   points.add(Vector3(x, y, z));
    // }

    final paint = Paint()..color = kAppGrey;
    for (var i = 0; i < points.length; i++) {
      print('${sin(points[i].dx)}, ${sin(points[i].dy)}');
      points[i] = points[i].translate(0.01, 0.0, 0.0);

      final halfHeight = size.height / 2;
      final dy = (sin(points[i].dy) * halfHeight) + halfHeight;

      final halfWidth = size.width / 2;
      final dx = (sin(points[i].dx) * halfWidth) + halfWidth;

      final point = points[i].translate(
        dx,
        dy,
        0,
      );
      canvas.drawCircle(point.offset, 10 * (sin(point.dz) + 2), paint);

      // if (points[i].dy > 1) {
      //   points[i] = Vector3(points[i].dx, 0, points[i].dz);
      // } else if (points[i].dy < ) {
      //   points[i] = Vector3(points[i].dx, 1, points[i].dz);
      // } else if (points[i].dx > 1) {
      //   points[i] = Vector3(0, points[i].dy, points[i].dz);
      // } else if (points[i].dx < -1) {
      //   points[i] = Vector3(1, points[i].dy, points[i].dz);
      // }
    }
  }

  @override
  bool shouldRepaint(SpherePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(SpherePainter oldDelegate) => false;
}
