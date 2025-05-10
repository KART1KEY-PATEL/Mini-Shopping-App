import 'package:mini_shopping_app/models/product_model.dart';

class LikesState {
  final List<Product> likedProducts;

  const LikesState({this.likedProducts = const []});

  LikesState copyWith({List<Product>? likedProducts}) {
    return LikesState(likedProducts: likedProducts ?? this.likedProducts);
  }

  bool isProductLiked(int productId) {
    return likedProducts.any((product) => product.id == productId);
  }
}
