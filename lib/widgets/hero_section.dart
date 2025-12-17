import 'package:flutter/material.dart';
import 'cta_section.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 197, 72, 26),
        alignment: Alignment(2, -1),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bienvenue chez NAJMA COFFE ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Savourez nos cafés torréfiés',
                  style: TextStyle(
                    color: Color.fromARGB(255, 8, 5, 5),
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 25),
                Center(child: CtaButton()),
              ],
            ),

            ///const SizedBox(width: 20), // espace horizontal entre texte et image
            // Image principale
            Image.asset(
              'assets/images/hero.png',
              height: 200,
              width: 175,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
