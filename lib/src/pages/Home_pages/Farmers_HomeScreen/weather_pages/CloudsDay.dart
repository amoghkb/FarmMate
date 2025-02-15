import 'package:flutter/material.dart';
import 'package:weather_animation/weather_animation.dart';

class CloudsDay extends StatefulWidget {
  const CloudsDay({super.key});

  @override
  State<CloudsDay> createState() => _CloudsDayState();
}

class _CloudsDayState extends State<CloudsDay> {
  @override
  Widget build(BuildContext context) {
    return WrapperScene(
      colors: const [Colors.black],
      children: [
        CloudWidget(
          cloudConfig: CloudConfig(
              color: Color.lerp(Colors.white, Colors.blue.shade100, 0.3)!),
        ),
        WindWidget(
          windConfig: WindConfig(color: Colors.blueGrey),
        ),
      ],
    );
  }
}
