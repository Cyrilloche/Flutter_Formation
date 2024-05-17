import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final int _incrementDefaultValue = 2;
  int _counter = 0;
  late int _customIncrementValue;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _customIncrementValue = _incrementDefaultValue;

    _textEditingController.addListener(_onIncrementUpdate);
    //nb : il est possible de se passer du contrôleur pour détecter les changements
    //de valeur du champs de texte en passant par l'écouteur onChanged
    //directement sur le widget TextField

    super.initState();
  }

  Future<void> _showAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erreur'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "La valeur de l'incrément doit être supérieure à 0",
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                setState(() {
                  _customIncrementValue = _incrementDefaultValue;
                });
                _textEditingController.text = _incrementDefaultValue.toString();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onIncrementUpdate() {
    try {
      final int customIncrement = int.parse(_textEditingController.text);

      setState(() {
        if (customIncrement > 0) {
          _counter = 0;
          _customIncrementValue = customIncrement;
        } else {
          _showAlert();
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e); //FormatException
      }
    }
  }

  void _customIncrementValueCounter() {
    setState(() {
      _counter = _counter + _customIncrementValue;
    });
  }

  num _getNumberOfClic(int counter, int customIncrementValue) {
    return counter == 0 ? 0 : counter / customIncrementValue;
  }

  Widget _buildNumberOfClicksMessage(int counter, int customIncrementValue) {
    return counter > 0
        ? Text(
            "Vous avez cliqué ${_getNumberOfClic(counter, customIncrementValue)} fois")
        : Container();
  }

  Widget _buildMathOperation(int counter, int? customIncrementValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('$counter + $customIncrementValue = '),
        Text(
          (counter + customIncrementValue!).toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }

  Widget _buildForm(
      int customIncrementValue, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: TextField(
          decoration: InputDecoration(
            hintText: customIncrementValue.toString(),
            labelText: "Incrément (= $customIncrementValue)",
          ),
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildForm(_customIncrementValue, _textEditingController),
          _buildMathOperation(_counter, _customIncrementValue),
          _buildNumberOfClicksMessage(_counter, _customIncrementValue),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _customIncrementValueCounter,
        tooltip: 'Increment',
        child: Text("+$_customIncrementValue"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
