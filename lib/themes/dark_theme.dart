import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark, 
    primary: Color.fromRGBO(48, 97, 242, 1.0),
    onPrimary: Colors.white,
    secondary: Color.fromRGBO(78, 97, 242, 1.0),
    onSecondary: Colors.white, 
    error: Colors.red, 
    onError: Colors.white,
    background: Color.fromRGBO(1, 1, 1, 1), 
    onBackground: Color.fromRGBO(23, 23, 23, 1),
    surface: Color.fromRGBO(1, 1, 1, 1), 
    onSurface: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromRGBO(1, 1, 1, 1),
    titleTextStyle: TextStyle(
      fontSize: 22.0,
      color: Colors.white
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 24.0,
    ),
    elevation: 0.0,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  useMaterial3: true,
);