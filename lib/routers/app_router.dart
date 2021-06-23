import 'package:auto_route/auto_route.dart';

import '../screens/about/about_screen.dart';
import '../screens/landing/landing_screen.dart';
import '../screens/main_screen.dart';
import '../screens/skills/skills_screen.dart';
import '../screens/work/work_screen.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: MainScreen,
      initial: true,
      children: [
        AutoRoute(page: LandingScreen, initial: true),
        AutoRoute(page: WorkScreen),
        AutoRoute(page: AboutScreen),
        AutoRoute(page: SkillsScreen),
      ],
    ),
  ],
)
class $AppRouter {}
