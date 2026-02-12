import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(12),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        childAspectRatio: 0.6, // contrôle la taille de la Card
        children: [
          buildFeature(
            "assets/images/cafe1.png",
            "Expresso Cafe",
            "7500",
            Icons.coffee,
          ),
          buildFeature(
            "assets/images/cafe2.png",
            "Calm Coffee",
            "6000",
            Icons.eco,
          ),
          buildFeature(
            "assets/images/cafe3.png",
            "Cafe Chocolat",
            "2000",
            Icons.shopping_cart,
          ),
          buildFeature(
            "assets/images/cafe4.png",
            "Caffe latte miel",
            "2500",
            Icons.coffee,
          ),
          buildFeature(
            "assets/images/cafe5.png",
            "Caffe Latte",
            "300",
            Icons.coffee,
          ),
          buildFeature(
            "assets/images/cafe8.png",
            "Calm coffe",
            "3500",
            Icons.coffee,
          ),
          buildFeature(
            "assets/images/cafe7.png",
            "Caffe  basique",
            "3500",
            Icons.coffee,
          ),
          buildFeature(
            "assets/images/cafe6.png",
            "Caffe matcha",
            "6000",
            Icons.coffee,
          ),
          buildFeature(
            "assets/images/cafe9.png",
            "Caffe oreo",
            "4500",
            Icons.coffee,
          ),
        ],
      ),
    );
  }

  Widget buildFeature(
    String imagePath,
    String text,
    String prix,
    IconData icon,
  ) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image en haut
            Image.asset(imagePath, height: 90, width: 90, fit: BoxFit.contain),
            const SizedBox(height: 8),

            // Ligne horizontale : icône + prix
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 22, color: Colors.brown),
                const SizedBox(width: 6),
                Text(
                  "$prix F",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            // Texte du produit en dessous
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
