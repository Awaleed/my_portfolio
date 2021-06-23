import 'package:division/division.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerTxtStyle = TxtStyle()
      ..textColor(Colors.white)
      ..padding(horizontal: 10)
      ..textAlign.center()
      ..fontWeight(FontWeight.bold)
      ..fontSize(18);
    return FittedBox(
      child: Column(
        children: [
          Txt(
            'Abdulrahman',
            style: headerTxtStyle,
          ),
          SizedBox(height: 10),
          Txt(
            'Mobile Developer',
            style: TxtStyle()
              ..add(headerTxtStyle)
              ..fontWeight(FontWeight.w100),
          )
        ],
      ),
    );
  }
}
