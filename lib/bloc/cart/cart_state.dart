import 'package:mini_shopping_app/models/cart_item_model.dart';

class CartState {
  final List<CartItem> items;

  const CartState({this.items = const []});

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items: items ?? this.items);
  }

  bool isItemInCart(int productId) {
    return items.any((item) => item.product.id == productId);
  }

  int getItemQuantity(int productId) {
    return items.fold(0, (sum, item) {
      return item.product.id == productId ? sum + item.quantity : sum;
    });
  }

  List<CartItem> getAllItems() => items;

  // New function to calculate subtotal (price * quantity + 10% of price * quantity)
  double get subtotal {
    return items.fold(0.0, (total, item) {
      final itemTotal = item.product.price * item.quantity;
      final additionalCharge = 0.1 * item.product.price * item.quantity;
      return total + itemTotal + additionalCharge;
    });
  }

  // New function to calculate delivery charge (5% of subtotal)
  double get deliveryCharge {
    return subtotal * 0.05;
  }

  // New function to calculate total (subtotal + delivery charge)
  double get total {
    return subtotal + deliveryCharge;
  }
}
