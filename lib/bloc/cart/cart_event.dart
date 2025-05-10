import 'package:mini_shopping_app/models/product_model.dart';

abstract class CartEvent {}

class AddItem extends CartEvent {
  final Product product;
  AddItem(this.product);
}

class IncrementItem extends CartEvent {
  final Product product;
  IncrementItem(this.product);
}

class DecrementItem extends CartEvent {
  final Product product;
  DecrementItem(this.product);
}

class RemoveItem extends CartEvent {
  final Product product;
  RemoveItem(this.product);
}
