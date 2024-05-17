import 'dart:math';
import 'package:casino/list_images.dart';

final int maximum = listImages.length;

int randomNumber() {
  var value = Random().nextInt(maximum);
  return value;
}
