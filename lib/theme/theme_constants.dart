import 'package:flutter/material.dart';

const colorPrimary = Colors.pink;
const colorBackground = Colors.black;
const cardColor = Colors.grey;

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  cardColor: cardColor,
  primaryColor: colorPrimary,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(backgroundColor: colorBackground),
  textTheme: TextTheme(),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
);

// final textTheme = TextTheme(
//   titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
//   titleMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
//   titleSmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
//   bodyMedium: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
//   bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
//   labelSmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
// );
