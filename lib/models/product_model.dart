class Product {
  final int id;
  final String brand;
  final String name;

  final String smallDescription;
  final String longDescription;
  final List<String> sizes;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.brand,
    required this.name,
    required this.smallDescription,
    required this.longDescription,
    required this.sizes,
    required this.price,
    required this.image
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      brand: json['brand'],
      name: json['name'],
      smallDescription: json['small_description'],
      longDescription: json['long_description'],
      sizes: List<String>.from(json['sizes']),
      price: (json['price'] as num).toDouble(),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'name': name,
      'small_description': smallDescription,
      'long_description': longDescription,
      'sizes': sizes,
      'price': price,
      'image': image,
    };
  }
}

class ProductList {
  final List<Product> products;

  ProductList({required this.products});

  factory ProductList.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as List;
    List<Product> products =
        productsJson
            .map((productJson) => Product.fromJson(productJson))
            .toList();

    return ProductList(products: products);
  }

  Map<String, dynamic> toJson() {
    return {'products': products.map((product) => product.toJson()).toList()};
  }
}
