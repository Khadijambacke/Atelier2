import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          socialIcon(FontAwesomeIcons.instagram),
          socialIcon(FontAwesomeIcons.facebook),
          socialIcon(FontAwesomeIcons.twitter),
          socialIcon(FontAwesomeIcons.linkedin),
          socialIcon(FontAwesomeIcons.github),
        ],
      ),
    );
  }

  Widget socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}
