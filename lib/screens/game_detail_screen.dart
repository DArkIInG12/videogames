import 'package:flutter/material.dart';
import 'package:games_app/game.dart';
import 'package:google_fonts/google_fonts.dart';

class GameDetail extends StatefulWidget {
  const GameDetail({super.key});

  @override
  State<GameDetail> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Game;
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
      body: Column(
        children: [
          Hero(
              tag: arguments,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(child: Image.asset(arguments.image)),
              )),
          const SizedBox(
            height: 30,
          ),
          Text(
            arguments.name,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(children: [
              Text(
                "Price: \$ ${arguments.price}",
                textAlign: TextAlign.left,
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(arguments.description)
        ],
      ),
    );
  }
}
