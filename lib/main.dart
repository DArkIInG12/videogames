import 'package:flutter/material.dart';
import 'package:games_app/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'counter.dart';
import 'image_carousel.dart';
import 'package:games_app/global_values.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const FirstScreen());
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FirstScreen();
  }
}

class _FirstScreen extends State<FirstScreen> {
  void _toggleFavorite() {
    GlobalValues.centinel.value = !GlobalValues.centinel.value;
    GlobalValues.games.value[GlobalValues.index.value].isFavorite =
        !GlobalValues.games.value[GlobalValues.index.value].isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder(
          valueListenable: GlobalValues.index,
          builder: (context, value, _) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                leading: Row(
                  children: [
                    const SizedBox(
                      width: 5.0,
                    ),
                    IconButton(
                      color: Colors.white,
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                actions: [
                  badges.Badge(
                    position: badges.BadgePosition.topEnd(end: -6),
                    badgeAnimation: const badges.BadgeAnimation.rotation(
                      animationDuration: Duration(seconds: 1),
                      loopAnimation: false,
                      curve: Curves.fastOutSlowIn,
                      colorChangeAnimationCurve: Curves.easeInCubic,
                    ),
                    badgeContent:
                        Text(GlobalValues.cart.value.length.toString()),
                    showBadge: true,
                    badgeStyle: const badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
              backgroundColor: GlobalValues.games.value[value].bgColor,
              body: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const CarouselWithIndicatorDemo(),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            )),
                        height: 600,
                        width: 500,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  GlobalValues.games.value[value].name,
                                  style: const TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                    "\$ ${GlobalValues.games.value[value].price}"),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const CounterDesign(),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                const Text(
                                  'Descripción del Producto',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  GlobalValues.games.value[value].description,
                                  style: const TextStyle(
                                      letterSpacing: 2.0, fontSize: 15.0),
                                ),
                                const SizedBox(
                                  height: 30.0,
                                ),
                                Row(
                                  children: [
                                    ValueListenableBuilder(
                                        valueListenable: GlobalValues.centinel,
                                        builder: (context, cent, _) {
                                          return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white,
                                                elevation: 0.0,
                                                fixedSize: const Size(80, 60),
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 2,
                                                        color: GlobalValues
                                                            .games
                                                            .value[value]
                                                            .bgColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13))),
                                            onPressed: _toggleFavorite,
                                            child: IconButton(
                                              icon: GlobalValues.games
                                                      .value[value].isFavorite
                                                  ? Icon(
                                                      Icons.favorite_border,
                                                      color: GlobalValues.games
                                                          .value[value].bgColor,
                                                    )
                                                  : Icon(
                                                      Icons.favorite,
                                                      color: GlobalValues.games
                                                          .value[value].bgColor,
                                                    ),
                                              onPressed: () {
                                                _toggleFavorite();
                                              },
                                            ),
                                          );
                                        }),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: GlobalValues
                                              .games.value[value].bgColor,
                                          elevation: 0.0,
                                          fixedSize: const Size(220, 60),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13))),
                                      onPressed: () {
                                        if (!GlobalValues.cart.value.contains(
                                            GlobalValues.games.value[value])) {
                                          GlobalValues.cart.value.add(
                                              GlobalValues.games.value[value]);
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "This is Center Short Toast",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      },
                                      child: const Text(
                                        'Add to cart',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
      routes: getRoutes(),
    );
  }
}
