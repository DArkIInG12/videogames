import 'package:flutter/material.dart';
import 'package:games_app/game.dart';

class GlobalValues {
  static double itemPrice = 0;
  static ValueNotifier<int> index = ValueNotifier<int>(0);
  static ValueNotifier<bool> centinel = ValueNotifier<bool>(true);

  static ValueNotifier<List> games = ValueNotifier<List>([
    Game(
        name: "The Legend Of Zelda: Tears Of The Kingdom",
        description: "Posible GoTY",
        image: "images/zelda.webp",
        bgColor: const Color.fromARGB(232, 70, 187, 177),
        price: 1199.00,
        isFavorite: true),
    Game(
        name: "Super Smash Bros. Ultimate",
        description: "Diversion sin fin con tus amigos",
        image: "images/smash.jpg",
        bgColor: const Color.fromARGB(209, 231, 101, 188),
        price: 999.00,
        isFavorite: false),
    Game(
        name: "The Legend of Zelda: Breath of the Wild",
        description: "Considerado como el mejor juego de la historia",
        image: "images/zeldaB.jpg",
        bgColor: const Color.fromARGB(224, 236, 135, 67),
        price: 1199.00,
        isFavorite: false)
  ]);

  static ValueNotifier<List> cart = ValueNotifier<List>([]);
}
