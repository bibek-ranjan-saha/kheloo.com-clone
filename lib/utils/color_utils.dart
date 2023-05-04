import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; // 8 character with 100% opacity
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}