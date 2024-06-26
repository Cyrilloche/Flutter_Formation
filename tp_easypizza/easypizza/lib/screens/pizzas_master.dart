import 'package:easypizza/classes/cart_provider.dart';
import 'package:easypizza/classes/likes_provider.dart';
import 'package:easypizza/models/pizza.dart';
import 'package:flutter/material.dart';
import 'package:easypizza/data/pizzas.dart' as db;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PizzasMaster extends StatelessWidget {
  const PizzasMaster({super.key});

  @override
  Widget build(BuildContext context) {
    final likes = context.watch<LikesProvider>();
    final cart = context.watch<CartProvider>();
    return MaterialApp(
      title: 'EasyPizza',
      home: Scaffold(
        appBar: AppBar(
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
          centerTitle: true,
          title: const Text('Pizza della mama'),
          flexibleSpace: const Image(
            image: AssetImage('assets/images/appbar_background.png'),
            fit: BoxFit.cover,
          ),
          actions: [
            IconButton(
              tooltip: "Cart",
              onPressed: () => context.goNamed('cart'),
              icon: Badge(
                isLabelVisible: true,
                label: Text(cart.numberOfPizza.toString()),
                offset: const Offset(8, 8),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: const Icon(
                  IconData(0xe59a, fontFamily: 'MaterialIcons'),
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView.builder(
            itemCount: db.pizzas.length,
            itemBuilder: (BuildContext context, int index) {
              final Pizza currentPizza = db.pizzas[index];
              final String currentId = index.toString();
              final Color colorLike =
                  likes.isLiked(currentPizza) ? Colors.red : Colors.grey;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => context.goNamed(
                    'details',
                    pathParameters: {'id': currentId},
                  ),
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
                              '${currentPizza.ingredients.length} ${currentPizza.ingredients.length > 1 ? 'ingredienti' : 'ingrediente'}',
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
                      Icon(
                        Icons.favorite,
                        color: colorLike,
                      ),
                      IconButton(
                        onPressed: () => cart.add(currentPizza),
                        icon: const Icon(
                          IconData(0xf538, fontFamily: 'MaterialIcons'),
                        ),
                      )
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
