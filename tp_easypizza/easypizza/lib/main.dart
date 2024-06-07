import 'package:easypizza/screens/pizza_details.dart';
import 'package:easypizza/screens/pizzas_master.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const PizzasMaster();
        },
      ),
      GoRoute(
        name: 'pizza',
        path: '/pizza/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return PizzaDetails(id: id);
        },
      )
    ],
  );
  runApp(MyApp(router: router));
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
