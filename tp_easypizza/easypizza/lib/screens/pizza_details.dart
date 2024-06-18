import 'package:easypizza/models/pizza.dart';
import 'package:flutter/material.dart';
import 'package:easypizza/data/pizzas.dart' as db;
import 'package:go_router/go_router.dart';

class PizzaDetails extends StatelessWidget {
  const PizzaDetails({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    final currentIndex = int.parse(id);
    final Pizza currentPizza = db.pizzas[currentIndex];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => context.go('/'),
          ),
          centerTitle: true,
          title: Text(currentPizza.name),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/pizza.png',
                  width: 150,
                  height: 150,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${currentPizza.ingredients.length} ${currentPizza.ingredients.length > 1 ? 'ingredienti' : 'ingrediente'}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: currentPizza.ingredients.map((ingredient) {
                    return Chip(
                      label: Text(ingredient),
                    );
                  }).toList(),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
