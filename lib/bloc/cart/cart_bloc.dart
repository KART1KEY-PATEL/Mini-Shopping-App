// cart_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_event.dart';
import 'package:mini_shopping_app/bloc/cart/cart_state.dart';
import 'package:mini_shopping_app/models/cart_item_model.dart';




class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddItem>(_onAddItem);
    on<IncrementItem>(_onIncrementItem);
    on<DecrementItem>(_onDecrementItem);
    on<RemoveItem>(_onRemoveItem);
  }

  void _onAddItem(AddItem event, Emitter<CartState> emit) {
    final currentItems = List<CartItem>.from(state.items);
    final index = currentItems.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (index != -1) {
      currentItems[index] = currentItems[index].copyWith(
        quantity: currentItems[index].quantity + 1,
      );
    } else {
      currentItems.add(CartItem(product: event.product, quantity: 1));
    }

    emit(state.copyWith(items: currentItems));
  }

  void _onIncrementItem(IncrementItem event, Emitter<CartState> emit) {
    final currentItems = List<CartItem>.from(state.items);
    final index = currentItems.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (index != -1) {
      currentItems[index] = currentItems[index].copyWith(
        quantity: currentItems[index].quantity + 1,
      );
      emit(state.copyWith(items: currentItems));
    }
  }

  void _onDecrementItem(DecrementItem event, Emitter<CartState> emit) {
    final currentItems = List<CartItem>.from(state.items);
    final index = currentItems.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    if (index != -1) {
      final newQuantity = currentItems[index].quantity - 1;

      if (newQuantity > 0) {
        currentItems[index] = currentItems[index].copyWith(
          quantity: newQuantity,
        );
      } else {
        currentItems.removeAt(index);
      }

      emit(state.copyWith(items: currentItems));
    }
  }

  void _onRemoveItem(RemoveItem event, Emitter<CartState> emit) {
    final currentItems = List<CartItem>.from(state.items);
    currentItems.removeWhere((item) => item.product.id == event.product.id);
    emit(state.copyWith(items: currentItems));
  }
}
