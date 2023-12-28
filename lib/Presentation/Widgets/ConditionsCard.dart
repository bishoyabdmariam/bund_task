import 'package:flutter/material.dart';

import '../../Constants/TextStylesConstants.dart';

class ConditionsCard extends StatelessWidget {
  const ConditionsCard({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,

        ),
        width: MediaQuery.of(context).size.width / 2.6,
        height: MediaQuery.of(context).size.width / 3,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                text,
                style: Styles.style12,
              ),
            ),
          ],
        ),

    );
  }
}
