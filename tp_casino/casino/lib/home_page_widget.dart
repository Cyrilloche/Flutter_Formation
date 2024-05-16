import 'package:casino/display_image.dart';
import 'package:casino/message.dart';
import 'package:casino/random.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});
  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int firstNumber = 0;
  int secondNumber = 0;
  int thirdNumber = 0;
  bool _isWin = false;
  bool _hasPlay = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    checkNumbers(int firstNumber, int secondNumber, int thirdNumber) {
      if (firstNumber == secondNumber && firstNumber == thirdNumber) {
        _isWin = true;
      } else {
        _isWin = false;
      }
    }

    play() {
      setState(() {
        firstNumber = randomNumber();
        secondNumber = randomNumber();
        thirdNumber = randomNumber();
        _hasPlay = true;
      });

      checkNumbers(firstNumber, secondNumber, thirdNumber);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Casino"),
        titleTextStyle: const TextStyle(
          fontSize: 40,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DisplayImage(number: firstNumber),
                DisplayImage(number: secondNumber),
                DisplayImage(number: thirdNumber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _hasPlay ? Message(isWin: _isWin) : Container(),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: play,
        tooltip: 'play',
        child: const Icon(
          Icons.play_arrow,
        ),
      ),
    );
  }
}
