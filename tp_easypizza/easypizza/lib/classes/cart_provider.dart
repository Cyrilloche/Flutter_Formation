import 'package:easypizza/models/pizza.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Pizza> _cart = [];
  double priceTotal = 0;
  int numberOfPizza = 0;

  List<Pizza> get cart => _cart;

  void add(Pizza pizza) {
    _cart.add(pizza);
    priceTotal += pizza.price;
    numberOfPizza++;
    notifyListeners();
  }

  void remove(Pizza pizza) {
    _cart.remove(pizza);
    priceTotal -= pizza.price;
    numberOfPizza--;
    notifyListeners();
  }

  int isOrder(Pizza pizza) {
    var result = _cart.where((p) => p == pizza);
    return result.length;
  }
}
