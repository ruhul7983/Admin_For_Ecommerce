import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const TileWidget({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 100,
          color: Colors.white,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
