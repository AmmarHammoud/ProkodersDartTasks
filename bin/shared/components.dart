import 'dart:io';

String readInput() {
  String? input = stdin.readLineSync();
  if (input == null) {
    throw Exception('invalid input');
  }
  return input;
}

int inputInteger() {
  return int.parse(readInput());
}

double inputDouble() {
  return double.parse(readInput());
}
