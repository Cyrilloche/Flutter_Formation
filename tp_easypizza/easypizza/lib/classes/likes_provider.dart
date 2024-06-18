import 'package:easypizza/models/pizza.dart';
import 'package:flutter/material.dart';

class LikesProvider extends ChangeNotifier {
  final List<String> _ids = [];

  //List<String> get ids = List(_ids);

  void toggleLiked(Pizza pizza) {
    _ids.contains(pizza.id) ? remove(pizza) : add(pizza);
  }

  void add(Pizza pizza) {
    _ids.add(pizza.id);
    notifyListeners();
  }

  void remove(Pizza pizza) {
    _ids.remove(pizza.id);
    notifyListeners();
  }

  bool isLiked(Pizza pizza) {
    return _ids.contains(pizza.id);
  }
}
