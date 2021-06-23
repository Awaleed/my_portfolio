import 'dart:math';

import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components/text_animations/bouncing_characters.dart';
import 'package:my_portfolio/utils/size_config.dart';

import '../../components/animated_stars.dart';
import '../../components/text_animations/animated_sliding_text.dart';
import '../../config/app_colors.dart';
import 'components/experience_card.dart';
import 'components/skill_progress.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(5)),
      color: Colors.grey.shade900,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BouncingCharactersWidget('Skills &'),
                BouncingCharactersWidget('Experience'),
                SizedBox(height: 20),
                Txt(
                  'Since beginning my journey as a freelance developer nearly 10 years ago, I’ve done remote work for agencies, consulted for startups, and collaborated with talented people to create web products for both business and consumer use.',
                  style: TxtStyle()
                    ..textColor(Colors.white)
                    ..fontWeight(FontWeight.w100)
                    ..fontSize(20),
                ),
                SizedBox(height: 20),
                Txt(
                  'I create successful responsive websites that are fast, easy to use, and built with best practices. The main area of my expertise is front-end development, HTML, CSS, JS, building small and medium web apps, custom plugins, features, animations, and coding interactive layouts.',
                  style: TxtStyle()
                    ..textColor(Colors.white)
                    ..fontWeight(FontWeight.w100)
                    ..fontSize(20),
                ),
                SizedBox(height: 20),
                Txt(
                  'I also have full-stack developer experience with popular open-source CMS like (WordPress, Drupal, Magento, Keystone.js and others) .',
                  style: TxtStyle()
                    ..textColor(Colors.white)
                    ..fontWeight(FontWeight.w100)
                    ..fontSize(20),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                      'Visit my LinkedIn profile for more details or just contact me.'),
                ),
              ],
            ),
          ),
          SizedBox(width: SizeConfig.width(5)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SkillProgressWidget(
                  label: 'Flutter',
                  progress: 50,
                  color: Colors.amber,
                ),
                SkillProgressWidget(
                  label: 'Dart',
                  progress: 79,
                  color: Colors.purple,
                ),
                SizedBox(height: SizeConfig.height(5)),
                Row(
                  children: [
                    Expanded(
                      child: ExperienceCardWidget(
                        title: 'Frontend developer',
                        subTitle: 'To The End\n2017-2018',
                        body:
                            'Award-winning Content Marketing Agency specialises in creating and sharing engaging content.',
                      ),
                    ),
                    SizedBox(width: SizeConfig.width(2)),
                    Expanded(
                      child: ExperienceCardWidget(
                        title: 'Frontend developer',
                        subTitle: 'To The End\n2017-2018',
                        body:
                            'Award-winning Content Marketing Agency specialises in creating and sharing engaging content.',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
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
