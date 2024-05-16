import 'package:casino/loose_text.dart';
import 'package:casino/win_text.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key, required this.isWin});

  final bool isWin;

  final String winString = jackpot;
  final String looseString = loose;

  @override
  Widget build(BuildContext context) {
    return Text(
      style: const TextStyle(
        fontSize: 35,
      ),
      isWin ? jackpot : loose,
    );
  }
}
