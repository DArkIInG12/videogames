import 'package:flutter/widgets.dart';
import 'package:games_app/screens/cart_screen.dart';
import 'package:games_app/screens/game_detail_screen.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/cart': (BuildContext context) => const Cart(),
    '/detail_game': (BuildContext context) => const GameDetail()
  };
}
