import 'package:bundtask/main.dart';
import 'package:flutter/material.dart';

import '../../Constants/TextStylesConstants.dart';

class WhatYouGetCard extends StatelessWidget {
  const WhatYouGetCard({
    Key? key,
    required this.text,
    required this.image,
    required this.isEnabled,
  }) : super(key: key);

  final String image;
  final String text;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      width: MyApp.screenWidth / 4,
      height: MyApp.screenHeight / 6.6,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,color: isEnabled?const Color(0xFF0B1222): Colors.grey[200]),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              text,
              style: isEnabled? Styles.style12 : Styles.style12NotEnabled,
            ),
          ),
        ],
      ),
    );
  }
}
