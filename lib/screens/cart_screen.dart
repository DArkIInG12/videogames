import 'package:flutter/material.dart';
import 'package:games_app/global_values.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
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
                color: Colors.black,
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: GlobalValues.cart.value.length,
          // ignore: prefer_const_constructors
          itemBuilder: (context, index) => Card(
            child: GestureDetector(
              child: ListTile(
                leading: Hero(
                  tag: GlobalValues.cart.value[index],
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(GlobalValues.cart.value[index].image),
                  ),
                ),
                title: Text(GlobalValues.cart.value[index].name),
                subtitle: Text("\$ ${GlobalValues.cart.value[index].price}"),
                trailing: GlobalValues.cart.value[index].isFavorite
                    ? Icon(
                        Icons.favorite_border,
                        color: GlobalValues.cart.value[index].bgColor,
                      )
                    : Icon(
                        Icons.favorite,
                        color: GlobalValues.cart.value[index].bgColor,
                      ),
                onTap: () {
                  Navigator.pushNamed(context, '/detail_game',
                      arguments: GlobalValues.cart.value[index]);
                },
              ),
            ),
          ),
        ));
  }
}
