import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shopping_app/bloc/like/like_bloc.dart';
import 'package:mini_shopping_app/bloc/like/like_event.dart';
import 'package:mini_shopping_app/bloc/like/like_state.dart';
import 'package:mini_shopping_app/models/product_model.dart';

class CustomLikeButton extends StatelessWidget {
  final Product product;

  const CustomLikeButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikesBloc, LikesState>(
      builder: (context, state) {
        final isLiked = state.isProductLiked(product.id);
        return IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_outline,
            color: isLiked ? Colors.red : Colors.grey,
            size: 30,
          ),
          onPressed: () {
            context.read<LikesBloc>().add(ToggleLike(product));
          },
        );
      },
    );
  }
}
