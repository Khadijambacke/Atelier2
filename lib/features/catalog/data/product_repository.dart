class Product {
  final String id;
  final String name;
  final String prix;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.prix,
    required this.imagePath,
  });
}

final List<Product> mockProducts = [
  Product(
    id: '1',
    name: 'Expresso Cafe',
    prix: '7500',
    imagePath: 'assets/images/cafe1.png',
  ),
  Product(
    id: '2',
    name: 'Calm Coffee',
    prix: '6000',
    imagePath: 'assets/images/cafe2.png',
  ),
  Product(
    id: '3',
    name: 'Cafe Chocolat',
    prix: '2000',
    imagePath: 'assets/images/cafe3.png',
  ),
  Product(
    id: '4',
    name: 'Caffe latte miel',
    prix: '2500',
    imagePath: 'assets/images/cafe4.png',
  ),
  Product(
    id: '5',
    name: 'Caffe Latte',
    prix: '300',
    imagePath: 'assets/images/cafe5.png',
  ),
  Product(
    id: '6',
    name: 'Calm Coffee',
    prix: '3500',
    imagePath: 'assets/images/cafe8.png',
  ),
  Product(
    id: '7',
    name: 'Caffe basique',
    prix: '3500',
    imagePath: 'assets/images/cafe7.png',
  ),
  Product(
    id: '8',
    name: 'Caffe matcha',
    prix: '6000',
    imagePath: 'assets/images/cafe6.png',
  ),
  Product(
    id: '9',
    name: 'Caffe oreo',
    prix: '4500',
    imagePath: 'assets/images/cafe9.png',
  ),
];

Product? getProductById(String id) {
  try {
    return mockProducts.firstWhere((p) => p.id == id);
  } catch (_) {
    return null;
  }
}
