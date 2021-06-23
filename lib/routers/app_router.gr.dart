// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../screens/about/about_screen.dart' as _i6;
import '../screens/landing/landing_screen.dart' as _i4;
import '../screens/main_screen.dart' as _i3;
import '../screens/skills/skills_screen.dart' as _i7;
import '../screens/work/work_screen.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MainScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<MainScreenArgs>(orElse: () => const MainScreenArgs());
          return _i3.MainScreen(key: args.key);
        }),
    LandingScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.LandingScreen();
        }),
    WorkScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.WorkScreen();
        }),
    AboutScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.AboutScreen();
        }),
    SkillsScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.SkillsScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MainScreen.name, path: '/', children: [
          _i1.RouteConfig(LandingScreen.name, path: ''),
          _i1.RouteConfig(WorkScreen.name, path: 'work-screen'),
          _i1.RouteConfig(AboutScreen.name, path: 'about-screen'),
          _i1.RouteConfig(SkillsScreen.name, path: 'skills-screen')
        ])
      ];
}

class MainScreen extends _i1.PageRouteInfo<MainScreenArgs> {
  MainScreen({_i2.Key? key, List<_i1.PageRouteInfo>? children})
      : super(name,
            path: '/',
            args: MainScreenArgs(key: key),
            initialChildren: children);

  static const String name = 'MainScreen';
}

class MainScreenArgs {
  const MainScreenArgs({this.key});

  final _i2.Key? key;
}

class LandingScreen extends _i1.PageRouteInfo {
  const LandingScreen() : super(name, path: '');

  static const String name = 'LandingScreen';
}

class WorkScreen extends _i1.PageRouteInfo {
  const WorkScreen() : super(name, path: 'work-screen');

  static const String name = 'WorkScreen';
}

class AboutScreen extends _i1.PageRouteInfo {
  const AboutScreen() : super(name, path: 'about-screen');

  static const String name = 'AboutScreen';
}

class SkillsScreen extends _i1.PageRouteInfo {
  const SkillsScreen() : super(name, path: 'skills-screen');

  static const String name = 'SkillsScreen';
}
