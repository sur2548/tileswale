import 'package:flutter/material.dart';

const kAuthBackgroundColor = Color(0xFFF0FFFF);
const kColorBackground = Color(0xffeef2f5);

ThemeData get theme => ThemeData(
      primaryColor: Colors.indigo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

TextStyle get loginStyle => const TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    );

InputDecoration loginDecoration(IconData icon, String hint) {
  return InputDecoration(
    hintText: hint,
    border: InputBorder.none,
    icon: Icon(icon, color: Colors.black, size: 22.0),
    hintStyle: const TextStyle(fontSize: 17.0),
  );
}
