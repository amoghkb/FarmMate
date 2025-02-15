import 'package:flutter/material.dart';
import 'package:weather_animation/weather_animation.dart';

class SunnyDay extends StatefulWidget {
  const SunnyDay({super.key});

  @override
  State<SunnyDay> createState() => _SunnyDayState();
}

class _SunnyDayState extends State<SunnyDay> {
  @override
  Widget build(BuildContext context) {
    return const WrapperScene(
      colors: [Colors.black],
      children: [
        SunWidget(),
      ],
    );
  }
}
