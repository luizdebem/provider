import 'package:flutter/material.dart';
import 'package:signup/theme/custom_swatch.dart';

final ThemeData defaultTheme = _buildDefaultTheme();

ThemeData _buildDefaultTheme() {
  final ThemeData base = ThemeData(
    primarySwatch: createMaterialColor(
      Colors.blueGrey,
    ),
  );

  return base.copyWith(
    inputDecorationTheme: InputDecorationTheme().copyWith(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: base.primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: base.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: base.errorColor,
        ),
      ),
      border: OutlineInputBorder(),
    ),
  );
}
