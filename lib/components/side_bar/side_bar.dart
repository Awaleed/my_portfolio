import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/main_screen.dart';
import '../../routers/app_router.gr.dart' as router;
import 'header_text.dart';
import 'logo.dart';
import 'sections.dart';
import 'social_networks.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()
        ..background.color(Colors.black)
        ..width(130),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              kNavigatorKey.currentState?.controller
                  ?.replace(router.LandingScreen());
            },
            child: Column(
              children: [
                LogoWidget(),
                HeaderText(),
              ],
            ),
          ),
          Expanded(flex: 3, child: SectionsWidget()),
          Expanded(child: SocialNetworksWidget()),
        ],
      ),
    );
  }
}
