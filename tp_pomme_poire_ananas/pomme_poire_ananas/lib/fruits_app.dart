import 'package:flutter/material.dart';
import 'package:pomme_poire_ananas/fruits_list_widget.dart';

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomme Poire Ananas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const FruitsListWidget(title: 'Pomme Poire Ananas'),
    );
  }
}
