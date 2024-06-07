import 'package:easypizza/models/pizza.dart';
import 'package:flutter/material.dart';
import 'package:easypizza/data/pizzas.dart' as db;
import 'package:go_router/go_router.dart';

class PizzasMaster extends StatelessWidget {
  const PizzasMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyPizza',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pizza della mama'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: db.pizzas.length,
            itemBuilder: (BuildContext context, int index) {
              final Pizza currentPizza = db.pizzas[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => context.go('pizza/$index'),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/images/pizza.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentPizza.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${currentPizza.ingredients.length.toString()} ingrédients',
                              style: const TextStyle(
                                  fontSize: 14, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '${currentPizza.price.toStringAsFixed(2)}€',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
