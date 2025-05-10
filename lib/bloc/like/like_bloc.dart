// likes_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mini_shopping_app/bloc/like/like_event.dart';
import 'package:mini_shopping_app/bloc/like/like_state.dart';
import 'package:mini_shopping_app/models/product_model.dart';

class LikesBloc extends Bloc<LikesEvent, LikesState> {
  final Box<Product> _likesBox;

  LikesBloc()
    : _likesBox = Hive.box<Product>('likes'),
      super(
        LikesState(likedProducts: Hive.box<Product>('likes').values.toList()),
      ) {
    on<ToggleLike>(_onToggleLike);
    on<AddToLikes>(_onAddToLikes);
    on<RemoveFromLikes>(_onRemoveFromLikes);
  }

  void _onToggleLike(ToggleLike event, Emitter<LikesState> emit) {
    final currentLikes = List<Product>.from(state.likedProducts);
    final index = currentLikes.indexWhere((p) => p.id == event.product.id);

    if (index != -1) {
      currentLikes.removeAt(index);
    } else {
      currentLikes.add(event.product);
    }

    emit(state.copyWith(likedProducts: currentLikes));
    _saveToHive(currentLikes);
  }

  void _saveToHive(List<Product> likes) {
    _likesBox.clear();
    for (var product in likes) {
      _likesBox.add(product);
    }
  }

  void _onAddToLikes(AddToLikes event, Emitter<LikesState> emit) {
    final currentLikes = List<Product>.from(state.likedProducts);
    if (!currentLikes.any((p) => p.id == event.product.id)) {
      currentLikes.add(event.product);
      emit(state.copyWith(likedProducts: currentLikes));
    }
  }

  void _onRemoveFromLikes(RemoveFromLikes event, Emitter<LikesState> emit) {
    final currentLikes = List<Product>.from(state.likedProducts);
    currentLikes.removeWhere((p) => p.id == event.product.id);
    emit(state.copyWith(likedProducts: currentLikes));
  }
}
