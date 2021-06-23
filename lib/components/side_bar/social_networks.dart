import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/app_colors.dart';

class SocialNetworksWidget extends StatelessWidget {
  SocialNetworksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        IconButton(
          onPressed: () => launchUrl('https://www.google.com'),
          color: kAppGrey,
          hoverColor: Colors.white,
          icon: Icon(FontAwesomeIcons.facebook),
        ),
        // const Spacer(),
        // IconButton(
        //   onPressed: () {},
        //   color: kAppGrey,
        //   hoverColor: Colors.white,
        //   icon: Icon(FontAwesomeIcons.snapchat),
        // ),
        const Spacer(),
        IconButton(
          onPressed: () => launchUrl('https://www.google.com'),
          color: kAppGrey,
          hoverColor: Colors.white,
          icon: Icon(FontAwesomeIcons.instagram),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => launchUrl('https://google.com'),
          color: kAppGrey,
          hoverColor: Colors.white,
          icon: Icon(FontAwesomeIcons.twitter),
        ),
        const Spacer(),
      ].map((e) => e is Spacer ? e : Expanded(flex: 100, child: e)).toList(),
    );
  }

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
