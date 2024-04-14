import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isInterested;
  final VoidCallback? onPressed;

  const FavoriteIcon({super.key, required this.isInterested, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: isInterested
          ? const Icon(
              Icons.favorite,
              size: 28,
              color: Color.fromRGBO(247, 119, 119, 1),
            )
          : const Icon(
              Icons.favorite,
              size: 28,
              color: Colors.white,
            ),
    );
  }
}
