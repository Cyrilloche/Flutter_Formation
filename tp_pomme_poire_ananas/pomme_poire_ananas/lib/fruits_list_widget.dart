import 'package:flutter/material.dart';

class FruitsListWidget extends StatefulWidget {
  const FruitsListWidget({super.key, required this.title});
  final String title;

  @override
  State<FruitsListWidget> createState() => _FruitsListWidgetState();
}

class _FruitsListWidgetState extends State<FruitsListWidget> {
  int _counter = 0;

  void _addFruits() {
    setState(() {
      _counter++;
    });
  }

  // Widget _buildListOfItemWidget() {
  //   return ListView();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: ListView.builder(itemBuilder: (context, index) {}),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFruits,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
