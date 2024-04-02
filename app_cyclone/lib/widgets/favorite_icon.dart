import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isInterested;
  final VoidCallback? onPressed;

  const FavoriteIcon({super.key, required this.isInterested, this.onPressed});

  Widget buildFavorite(BuildContext context) {
    if (isInterested) {
      return const Icon(
        Icons.favorite,
        size: 24,
        color: Colors.pink,
      );
    } else {
      return const Icon(
        Icons.favorite_border_sharp,
        size: 24,
        color: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: isInterested
          ? const Icon(
              Icons.favorite,
              size: 24,
              color: Colors.pink,
            )
          : const Icon(
              Icons.favorite_border,
              size: 24,
              color: Colors.red,
            ),
    );
  }
}
