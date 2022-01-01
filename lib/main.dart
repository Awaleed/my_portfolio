import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'routers/app_router.gr.dart';
import 'utils/size_config.dart';

void main() {
  // ResponsiveSizingConfig.instance.setCustomBreakpoints(
  // ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
  // );

  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            SizeConfig.init(constraints.maxWidth, constraints.maxHeight);
            return child!;
          },
        );
      },
      // builder: (context, child) => LayoutBuilder(
      //   builder: (context, constraints) {
      //     SizeConfig.init(context);
      //     return Center(
      //       child: ConstrainedBox(
      //         constraints: BoxConstraints(maxWidth: 1920),
      //         child: child,
      //       ),
      //     );
      //   },
      // ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
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
    );
  }
}
