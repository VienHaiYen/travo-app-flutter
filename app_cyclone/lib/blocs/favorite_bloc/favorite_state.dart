import 'package:flutter/material.dart';

class FavoriteState {
  final List<String> images;

  FavoriteState({required this.images});

  factory FavoriteState.initial() {
    return FavoriteState(images: []);
  }
}
