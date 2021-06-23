import 'package:flutter/material.dart';

import 'package:mouse_parallax/mouse_parallax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ParallaxStack(
              layers: [
                ParallaxLayer(
                  yRotation: 0.35,
                  xOffset: 60,
                  // enable3d: true,
                  zRotation: .35,
                  child: Center(
                    child: Container(
                      width: 250,
                      height: 250,
                      color: Colors.black,
                    ),
                  ),
                ),
                ParallaxLayer(
                  yRotation: 0.35,
                  xOffset: 80,
                  enable3d: true,
                  // zRotation: .35,
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                ParallaxLayer(
                  yRotation: 0.35,
                  xOffset: 80,
                  enable3d: true,
                  zRotation: .35,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(''),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
