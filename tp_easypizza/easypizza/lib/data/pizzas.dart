import 'package:easypizza/classes/category.dart';
import 'package:easypizza/models/pizza.dart';

final List<Pizza> pizzas = [
  Pizza(
      name: "Margherita",
      price: 6,
      ingredients: ["Tomato", "Mozzarella", "Basil"],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Quattro Stagioni",
      price: 12,
      ingredients: [
        "Tomato",
        "Mozzarella",
        "Mushrooms",
        "Ham",
        "Artichokes",
        "Olives",
        "Oregano"
      ],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Capricciosa",
      price: 11,
      ingredients: [
        "Tomato",
        "Mozzarella",
        "Mushrooms",
        "Ham",
        "Artichokes",
        "Olives"
      ],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Marinara",
      price: 5,
      ingredients: ["Tomato", "Garlic", "Oregano"],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Regina",
      price: 10,
      ingredients: ["Tomato", "Mozzarella", "Ham", "Mushrooms"],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Diavola",
      price: 10,
      ingredients: ["Tomato", "Mozzarella", "Spicy Salami"],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Quattro Formaggi",
      price: 12,
      ingredients: ["Mozzarella", "Gorgonzola", "Parmesan", "Fontina"],
      category: PizzaCategory.bianca),
  Pizza(
      name: "Parma",
      price: 13,
      ingredients: ["Tomato", "Mozzarella", "Parma Ham", "Arugula", "Parmesan"],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Bianca",
      price: 10,
      ingredients: ["Mozzarella", "Ricotta", "Parmesan", "Garlic"],
      category: PizzaCategory.bianca),
  Pizza(
      name: "Ortolana",
      price: 6,
      ingredients: ["Tomato", "Mozzarella", "Grilled Vegetables"],
      category: PizzaCategory.veggie),
];
