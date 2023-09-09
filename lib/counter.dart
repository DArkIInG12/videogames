import 'package:flutter/material.dart';
import 'package:games_app/global_values.dart';

class CounterDesign extends StatefulWidget {
  const CounterDesign({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CounterDesign();
  }
}

class _CounterDesign extends State<CounterDesign> {
  int _n = 0;
  int _amt = 0;
  void add() {
    setState(() {
      _n++;
      _amt = _amt + 10;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
      _amt = _amt - 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150.0,
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  add();
                },
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text('$_n', style: const TextStyle(fontSize: 20.0)),
              const SizedBox(
                width: 10.0,
              ),
              IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                onPressed: () {
                  minus();
                },
              ),
              const SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 95.0,
        ),
        Text(
          'Rs $_amt',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
