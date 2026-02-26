import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/product_repository.dart';

class ProductPage extends StatelessWidget {
  final String productId;
  const ProductPage({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    final product = getProductById(productId);

    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Erreur')),
        body: const Center(child: Text('Produit introuvable')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/catalog'), // ← retour au catalogue
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(product.imagePath, height: 200, fit: BoxFit.contain),
            const SizedBox(height: 30),
            Text(
              product.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              '${product.prix} F CFA',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Un délicieux café préparé avec soin pour vous offrir le meilleur goût.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
