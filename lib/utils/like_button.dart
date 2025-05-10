import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class CustomLikeButton extends StatelessWidget {
  CustomLikeButton({super.key, required this.isLiked});
  bool isLiked;
  @override
  Widget build(BuildContext context) {
    return Icon(
      isLiked ? Icons.favorite : Icons.favorite_outline,
      color: isLiked ? Colors.red : Colors.grey,
      size: 30,
    );
  }
}
