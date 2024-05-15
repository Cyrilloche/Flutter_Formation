import 'package:flutter/material.dart';

import 'package:monalisa/artwork_widget.dart';

import 'package:monalisa/theme.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: theme,
      home: const ArtworkWidget(),
    );
  }
}
