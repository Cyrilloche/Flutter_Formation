import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});
  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _counter = 0;
  int _starter = 0;
  int _increment = 2;
  int _result = 2;
  bool _hasClicked = false;

  final TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _result = _starter + _increment;
    _textController.addListener(_updateIncrement);
  }

  void _updateIncrement() {
    final userEntry = _textController.text.trim();
    if (userEntry.isNotEmpty && int.tryParse(userEntry) != null) {
      setState(() {
        _increment = int.parse(userEntry);
        _result = _starter + _increment;
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _increment = int.tryParse(_textController.text) ?? _increment;
      _starter += _increment;
      _result = _starter + _increment;
      _hasClicked = true;
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _textController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Increment(=$_increment)',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a number';
                }
                if (int.tryParse(value)! < 1) {
                  return 'Please enter a valid number';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
            Text(
              _hasClicked == true ? 'Vous avez cliqué $_counter fois' : '',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$_starter + $_increment = ',
                ),
                Text(
                  '$_result',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Text('+ $_increment'),
      ),
    );
  }
}
