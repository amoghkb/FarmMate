import 'package:farmmate/src/pages/Landing_pages/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FarmMateApp());
}

class FarmMateApp extends StatefulWidget {
  const FarmMateApp({super.key});

  @override
  State<FarmMateApp> createState() => _FarmMateAppState();
}

class _FarmMateAppState extends State<FarmMateApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
              bodyMedium: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1.0),
                  fontFamily: "Poppins-SemiBold"),
              bodySmall: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                  fontFamily: "Poppins-SemiBold")),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(11),
                  backgroundColor: WidgetStatePropertyAll(
                      Color.fromRGBO(51, 114, 51, 1.0))))),
      debugShowCheckedModeBanner: false,
      home: welcome(),
    );
  }
}
