import 'package:auto_route/auto_route.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../routers/app_router.gr.dart' as router;
import '../../screens/main_screen.dart';

class SectionsWidget extends StatelessWidget {
  const SectionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(color: kAppGrey, thickness: .3, height: 0),
        SectionsItemWidget(label: 'about', route: router.AboutScreen()),
        Divider(color: kAppGrey, thickness: .3, height: 0),
        SectionsItemWidget(label: 'skills', route: router.SkillsScreen()),
        Divider(color: kAppGrey, thickness: .3, height: 0),
        SectionsItemWidget(label: 'work', route: router.WorkScreen()),
        Divider(color: kAppGrey, thickness: .3, height: 0),
        // SectionsItemWidget(label: 'blog', route: router.LandingScreen()),
        // Divider(color: kAppGrey, thickness: .3, height: 0),
        // SectionsItemWidget(label: 'contact', route: router.LandingScreen()),
        // Divider(color: kAppGrey, thickness: .3, height: 0),
      ],
    );
  }
}

class SectionsItemWidget extends StatelessWidget {
  const SectionsItemWidget({
    Key? key,
    required this.label,
    required this.route,
  }) : super(key: key);

  final String label;
  final PageRouteInfo route;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        kNavigatorKey.currentState?.controller?.replace(route);
      },
      style: TextButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 20)),
      child: Txt(
        label,
        style: TxtStyle()..textColor(kAppGrey),
      ),
    );
  }
}
