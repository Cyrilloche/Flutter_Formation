import 'package:flutter/material.dart';
import 'package:casino/list_images.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key, required this.number});

  final List imgList = listImages;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        imgList[number],
      ),
    );
  }
}
