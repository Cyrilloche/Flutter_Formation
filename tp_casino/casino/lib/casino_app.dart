import 'package:casino/home_page_widget.dart';
import 'package:flutter/material.dart';

class CasinoApp extends StatelessWidget {
  const CasinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casino',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePageWidget(),
    );
  }
}
