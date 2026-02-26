import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // ← ajoute ça

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
        childAspectRatio: 0.6,
        children: [
          // ← ajoute juste un id "1", "2", etc. devant chaque
          buildFeature(
            context,
            "1",
            "assets/images/cafe1.png",
            "Expresso Cafe",
            "7500",
            Icons.coffee,
          ),
          buildFeature(
            context,
            "2",
            "assets/images/cafe2.png",
            "Calm Coffee",
            "6000",
            Icons.eco,
          ),
          buildFeature(
            context,
            "3",
            "assets/images/cafe3.png",
            "Cafe Chocolat",
            "2000",
            Icons.shopping_cart,
          ),
          buildFeature(
            context,
            "4",
            "assets/images/cafe4.png",
            "Caffe latte miel",
            "2500",
            Icons.coffee,
          ),
          buildFeature(
            context,
            "5",
            "assets/images/cafe5.png",
            "Caffe Latte",
            "300",
            Icons.coffee,
          ),
          buildFeature(
            context,
            "6",
            "assets/images/cafe8.png",
            "Calm Coffee",
            "3500",
            Icons.coffee,
          ),
          buildFeature(
            context,
            "7",
            "assets/images/cafe7.png",
            "Caffe basique",
            "3500",
            Icons.coffee,
          ),
          buildFeature(
            context,
            "8",
            "assets/images/cafe6.png",
            "Caffe matcha",
            "6000",
            Icons.coffee,
          ),
          buildFeature(
            context,
            "9",
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
    BuildContext context, // ← ajouté
    String id, // ← ajouté
    String imagePath,
    String text,
    String prix,
    IconData icon,
  ) {
    return GestureDetector(
      // ← entoure la Card
      onTap: () {
        context.push('/product/$id'); // ← va vers la page détail
      },
      child: Card(
        // tout le reste est IDENTIQUE à avant
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                imagePath,
                height: 90,
                width: 90,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 8),
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
      ),
    );
  }
}
