import 'package:flutter/material.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(12),
      //padding: const EdgeInsets.all(16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // évite un double scroll
        crossAxisCount: 2, //
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
        children: [
          buildFeature(
            "assets/images/cafe1.png",
            "EXpresso cafe ",
            Icons.coffee,
          ),
          buildFeature("assets/images/cafe2.png", "Calm coffe ", Icons.eco),
          buildFeature(
            "assets/images/cafe3.png",
            "Cafe Chocolat",
            Icons.shopping_cart,
          ),
          buildFeature(
            "assets/images/cafe2.png",
            "Caffe latte ",
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
        Image.asset(imagePath, height: 110, width: 90, fit: BoxFit.contain),
        const SizedBox(height: 6),
        Icon(icon, size: 28, color: Colors.brown),

        const SizedBox(height: 5),

        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          softWrap: true,
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ],
    );
  }
}
