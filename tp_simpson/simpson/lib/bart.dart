import 'package:flutter/material.dart';
import 'package:simpson/message.dart';

class BartWidget extends StatelessWidget {
  const BartWidget({super.key, required this.text, required this.onTap});

  final String text;

  final Function(String value) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("images/Bart.png"),
        Message(text: text),
        ElevatedButton(
          onPressed: () => onTap("Salut Homer"),
          child: const Text("Répondre à Homer"),
        )
      ],
    );
  }
}
