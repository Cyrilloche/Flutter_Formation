import 'package:flutter/material.dart';
import 'package:simpson/bart.dart';
import 'package:simpson/message.dart';

class HomerWidget extends StatefulWidget {
  const HomerWidget({super.key});

  @override
  State<HomerWidget> createState() => _HomerWidgetState();
}

class _HomerWidgetState extends State<HomerWidget> {
  String _response = "";
  String _bartResponse = "";
  final TextEditingController _textEditingController = TextEditingController();

  void onEnfantTap(String value) {
    setState(() {
      _bartResponse = value;
    });
  }

  _speakToBart() {
    setState(() {
      _response = _textEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Form(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Message pour Bart",
                    ),
                    controller: _textEditingController,
                  ),
                ),
                ElevatedButton(
                  onPressed: _speakToBart,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                  ),
                  child: const Text('Parler à Bart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      )),
                ),
                Message(text: _bartResponse),
                Image.asset(
                  "images/Homer.png",
                ),
                BartWidget(
                  text: _response,
                  onTap: onEnfantTap,
                )
              ],
            ),
          ),
        ));
  }
}
