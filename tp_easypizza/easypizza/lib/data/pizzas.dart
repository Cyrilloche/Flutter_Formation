import 'package:easypizza/classes/category.dart';
import 'package:easypizza/models/pizza.dart';

final List<Pizza> pizzas = [
  Pizza(
      name: "Margherita",
      price: 6,
      ingredients: ["Pomodoro", "Mozzarella", "Basilico"],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Quattro Stagioni",
      price: 12,
      ingredients: [
        "Pomodoro",
        "Mozzarella",
        "Funghi",
        "Prosciutto",
        "Carciofi",
        "Olive",
        "Origano"
      ],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Capricciosa",
      price: 11,
      ingredients: [
        "Pomodoro",
        "Mozzarella",
        "Funghi",
        "Prosciutto",
        "Carciofi",
        "Olive"
      ],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Marinara",
      price: 5,
      ingredients: ["Pomodoro", "Aglio", "Origano"],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Regina",
      price: 10,
      ingredients: ["Pomodoro", "Mozzarella", "Prosciutto", "Funghi"],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Diavola",
      price: 10,
      ingredients: ["Pomodoro", "Mozzarella", "Salame Piccante"],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Quattro Formaggi",
      price: 12,
      ingredients: ["Mozzarella", "Gorgonzola", "Parmigiano", "Fontina"],
      category: PizzaCategory.bianca),
  Pizza(
      name: "Parma",
      price: 13,
      ingredients: [
        "Pomodoro",
        "Mozzarella",
        "Prosciutto di Parma",
        "Rucola",
        "Parmigiano"
      ],
      category: PizzaCategory.rossa),
  Pizza(
      name: "Bianca",
      price: 10,
      ingredients: ["Mozzarella", "Ricotta", "Parmigiano", "Aglio"],
      category: PizzaCategory.bianca),
  Pizza(
      name: "Ortolana",
      price: 6,
      ingredients: ["Pomodoro", "Mozzarella", "Verdure Grigliate"],
      category: PizzaCategory.veggie),
];
