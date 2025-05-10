import 'package:mini_shopping_app/models/product_model.dart';

abstract class LikesEvent {}

class ToggleLike extends LikesEvent {
  final Product product;
  ToggleLike(this.product);
}

class AddToLikes extends LikesEvent {
  final Product product;
  AddToLikes(this.product);
}

class RemoveFromLikes extends LikesEvent {
  final Product product;
  RemoveFromLikes(this.product);
}
