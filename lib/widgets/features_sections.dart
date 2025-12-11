import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        shrinkWrap: true, // évite les erreurs de hauteur infinie
        physics: const NeverScrollableScrollPhysics(), // évite un double scroll
        crossAxisCount: 2, //
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
        children: [
          buildFeature(
            "assets/images/cafe1.png",
            "EXpresso cafe :Voici un café pas comme les autres",
            Icons.coffee,
          ),
          buildFeature(
            "assets/images/cafe2.png",
            "Calm coffe:OREO/EXPRESSO",
            Icons.eco,
          ),
          buildFeature(
            "assets/images/cafe3.png",
            "Cafe Chocolat :Saveur fraiche . LIvraison partout a dakar",
            Icons.shopping_cart,
          ),
          buildFeature(
            "assets/images/cafe2.png",
            "Caffe latte :Un gout merveilleux",
            Icons.shopping_cart,
          ),
        ],
      ),
    );
  }

  Widget buildFeature(String imagePath, String text, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(imagePath, height: 110, width: 110, fit: BoxFit.contain),
        const SizedBox(height: 8),
        Icon(icon, size: 28, color: Colors.brown),

        const SizedBox(height: 5),

        // Texte seul → peut retourner correctement à la ligne
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    );
  }
}
