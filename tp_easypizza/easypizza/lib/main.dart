import 'package:easypizza/classes/cart_provider.dart';
import 'package:easypizza/classes/likes_provider.dart';
import 'package:easypizza/screens/cart_details.dart';
import 'package:easypizza/screens/pizza_details.dart';
import 'package:easypizza/screens/pizzas_master.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'menu',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const PizzasMaster();
        },
      ),
      GoRoute(
        name: 'details',
        path: '/pizza/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return PizzaDetails(id: id);
        },
      ),
      GoRoute(
        name: 'cart',
        path: '/cart',
        builder: (BuildContext context, GoRouterState state) {
          return const CartDetails();
        },
      ),
    ],
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LikesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MyApp(router: router),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({required this.router, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Easy Pizza',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
