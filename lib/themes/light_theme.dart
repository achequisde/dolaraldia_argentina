import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light, 
    primary: Color.fromRGBO(48, 97, 242, 1.0),
    onPrimary: Colors.white,
    secondary: Color.fromRGBO(78, 97, 242, 1.0),
    onSecondary: Colors.white, 
    error: Colors.red, 
    onError: Colors.white, 
    background: Color.fromRGBO(246, 246, 246, 1),
    onBackground: Color.fromRGBO(252, 252, 252, 1),
    surface: Color.fromRGBO(246, 246, 246, 1), 
    onSurface: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromRGBO(246, 246, 246, 1),
    titleTextStyle: TextStyle(
      fontSize: 22.0,
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 20.0
    ),
    elevation: 0.0,
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  useMaterial3: true,
);