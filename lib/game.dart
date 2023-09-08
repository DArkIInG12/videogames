import 'package:flutter/material.dart';

class Game {
  final String name;
  final String description;
  final String image;
  final Color bgColor;
  final double price;
  bool isFavorite;

  Game(
      {required this.name,
      required this.description,
      required this.image,
      required this.bgColor,
      required this.price,
      required this.isFavorite});
}
