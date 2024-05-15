import 'package:flutter/material.dart';
import 'package:simpson/homer.dart';

void main() {
  runApp(const SimpsonApp());
}

class SimpsonApp extends StatelessWidget {
  const SimpsonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Simpson",
      home: HomerWidget(),
    );
  }
}
