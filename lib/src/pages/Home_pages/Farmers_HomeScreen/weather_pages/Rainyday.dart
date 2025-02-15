import 'package:flutter/material.dart';
import 'package:weather_animation/weather_animation.dart';

class Rainyday extends StatefulWidget {
  const Rainyday({super.key});

  @override
  State<Rainyday> createState() => _RainydayState();
}

class _RainydayState extends State<Rainyday> {
  @override
  Widget build(BuildContext context) {
    return const WrapperScene(
      colors: [Colors.black],
      children: [
        CloudWidget(),
        RainWidget(),
        RainDropWidget(),
        ThunderWidget(),
        SingleThunderWidget()
      ],
    );
  }
}
