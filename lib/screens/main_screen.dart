import 'package:flutter/material.dart';

import '../components/drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerWidget(),
          Expanded(child: Placeholder()),
        ],
      ),
    );
  }
}
