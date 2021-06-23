import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../../components/text_animations/bouncing_characters.dart';
import '../../../config/app_colors.dart';
import '../../../utils/size_config.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: SizeConfig.listable,
      builder: (context, _, __) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BouncingCharactersWidget('Hi,'),
              BouncingCharactersWidget('I\'m Abdulrahman,'),
              BouncingCharactersWidget('Mobile Developer'),
              Txt(
                'Problem Solver / Flutter & Dart Expert',
                style: TxtStyle()
                  ..letterSpacing(3)
                  ..textColor(kAppGrey)
                  ..fontWeight(FontWeight.w100)
                  ..fontSize(20),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1, color: Colors.tealAccent),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Txt(
                    'Contact me!',
                    style: TxtStyle()
                      ..textColor(Colors.tealAccent)
                      ..letterSpacing(3)
                      ..fontWeight(FontWeight.w100)
                      ..fontSize(20),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
