import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: AppBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Nunito',
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0XFF8B8B8B),
        fontSize: 18,
      ),
    ),
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
  );
}