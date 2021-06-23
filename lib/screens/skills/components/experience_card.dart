import 'package:flutter/material.dart';

class ExperienceCardWidget extends StatelessWidget {
  const ExperienceCardWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.body,
  }) : super(key: key);
  final String title, subTitle, body;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.grey.shade800,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .overline
                  ?.copyWith(color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              body,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
