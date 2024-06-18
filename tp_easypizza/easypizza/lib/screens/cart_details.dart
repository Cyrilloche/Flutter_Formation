import 'package:easypizza/classes/cart_provider.dart';
import 'package:easypizza/models/pizza.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartDetails extends StatelessWidget {
  const CartDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();

    return MaterialApp(
      title: 'Carello',
      home: Scaffold(
        appBar: AppBar(
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
          centerTitle: true,
          title: const Text('Carello'),
          flexibleSpace: const Image(
            image: AssetImage('assets/images/appbar_background.png'),
            fit: BoxFit.cover,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => context.go('/'),
          ),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: cart.cart.length,
            itemBuilder: (BuildContext context, int index) {
              final Pizza currentPizza = cart.cart[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => context.goNamed(
                    'details',
                    pathParameters: {'id': currentPizza.id},
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
