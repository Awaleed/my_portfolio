import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../components/side_bar/side_bar.dart';
import 'cats/cats_screen.dart';

final kNavigatorKey = GlobalKey<AutoRouterState>();

class MainScreen extends StatelessWidget {
  MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      // appBar: AppBar(title: Text('My App')),
      body:
          //  AspectRatio(aspectRatio: 1, child: CatsScreen()),

          ScreenTypeLayout.builder(
        mobile: _buildTablet,
        tablet: _buildTablet,
        desktop: _buildDesktop,
      ),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SideBarWidget(),
        Expanded(
          child: ClipRRect(
            child: AutoRouter(key: kNavigatorKey),
          ),
        ),
      ],
    );
  }

  Widget _buildTablet(BuildContext context) {
    return AutoRouter(key: kNavigatorKey);
  }
}
