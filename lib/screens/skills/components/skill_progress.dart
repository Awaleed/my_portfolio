import 'package:flutter/material.dart';

class SkillProgressWidget extends StatelessWidget {
  const SkillProgressWidget({
    Key? key,
    required this.label,
    required this.progress,
    required this.color,
  }) : super(key: key);

  final String label;
  final int progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white),
        ),
        SizedBox(height: 10),
        LinearProgressIndicator(
          backgroundColor: Colors.transparent,
          color: color,
          value: progress / 100,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
