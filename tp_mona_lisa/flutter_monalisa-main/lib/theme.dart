import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.brown,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 30,
      fontFamily: "Merriweather",
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 15,
      fontFamily: "Merriweather",
    ),
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.brown,
  ),
);
