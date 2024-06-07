import 'package:easypizza/classes/category.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Pizza {
  String id = uuid.v4();
  String name;
  double price;
  List<String> ingredients;
  PizzaCategory category;

  Pizza(
      {required this.name,
      required this.price,
      required this.ingredients,
      required this.category});
}
