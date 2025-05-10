// cart_item.dart
import 'package:hive/hive.dart';
import 'package:mini_shopping_app/models/product_model.dart';

part 'cart_item_model.g.dart'; // Generated file

@HiveType(typeId: 1)
class CartItem {
  @HiveField(0)
  final Product product;
  @HiveField(1)
  final int quantity;

  CartItem({required this.product, required this.quantity});

  CartItem copyWith({Product? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}