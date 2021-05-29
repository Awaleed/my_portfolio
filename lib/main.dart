import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/size_config.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // builder: (context, child) {
      //   SizeConfig.init(context);

      //   // Column(
      //   //   children: [
      //   //     AspectRatio(aspectRatio: 16 / 9, child: child),
      //   //   ],
      //   // );
      // },
      home: Builder(builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            SizeConfig.init(context);
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1920),
                child: MainScreen(),
              ),
            );
          },
        );
      }),
    );
  }
}
