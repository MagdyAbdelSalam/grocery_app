class ProductImages {
  static const String broccoli = 'assets/images/products/broccoli.png';
  static const String avocado = 'assets/images/products/avocado.png';
  static const String pineapple = 'assets/images/products/pineapple.png';
  static const String grapes = 'assets/images/products/grapes.png';
  static const String banana = 'assets/images/products/banana.png';
  static const String orange = 'assets/images/products/orange.png';
  static const String peach = 'assets/images/products/peach.png';
  static const String pomegranate = 'assets/images/products/pomegranate.png';

  // Map product names to image paths
  static String? getImageForProduct(String productName) {
    final name = productName.toLowerCase();
    if (name.contains('broccoli')) return broccoli;
    if (name.contains('avocado')) return avocado;
    if (name.contains('pineapple')) return pineapple;
    if (name.contains('grape')) return grapes;
    if (name.contains('banana')) return banana;
    if (name.contains('orange')) return orange;
    if (name.contains('peach')) return peach;
    if (name.contains('pomegranate')) return pomegranate;
    return null;
  }
}
