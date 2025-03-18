import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  final String color;
  final void Function(String) setColor;

  const MySwitch({super.key, required this.color, required this.setColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "green",
          style: TextStyle(
            color: Colors.greenAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        Switch(
          value: color == "yellow",
          activeColor: Colors.yellow,
          inactiveThumbColor: Colors.brown,
          inactiveTrackColor: Colors.red.withOpacity(0.4),
          onChanged: (value) => setColor(value ? "yellow" : "green"),
        ),
        const Text(
          "yellow",
          style: TextStyle(
            color: Colors.yellowAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
