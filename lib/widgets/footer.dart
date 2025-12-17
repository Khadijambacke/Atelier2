import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 66, 44, 5),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _socialIcon(FontAwesomeIcons.instagram),
          _socialIcon(FontAwesomeIcons.facebook),
          _socialIcon(FontAwesomeIcons.twitter),
          _socialIcon(FontAwesomeIcons.linkedin),
          _socialIcon(FontAwesomeIcons.github),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: () {},
        icon: FaIcon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}
