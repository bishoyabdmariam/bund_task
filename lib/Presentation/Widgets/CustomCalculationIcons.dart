import 'package:flutter/material.dart';

class CustomCalculationIcons extends StatelessWidget {
  const CustomCalculationIcons({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0, // Adjust the elevation as needed
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 30.0, // Adjust the size as needed
        height: 30.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0x33989FB9),
        ),
        child: Icon(
          icon,
          size: 25, // Add icon color if needed
        ),
      ),
    );
  }
}
