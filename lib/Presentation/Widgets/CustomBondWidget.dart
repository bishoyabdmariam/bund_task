import 'package:flutter/material.dart';

import '../../Constants/SizedBoxesConstants.dart';
import '../../Constants/TextStylesConstants.dart';
class CustomBondWidget extends StatelessWidget {
  const CustomBondWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.data,
  });

  final String image;
  final String title;
  final String subTitle;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: Colors.white,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Image.asset(image),
            ),
            title: Text(
              title,
              style: Styles.style16Card,
            ),
            subtitle: Text(
              subTitle,
              style: Styles.style12BottomNavBar,
            ),
            trailing: Text(
              data,
              style: Styles.style14Green,
            ),
          ),
        ),
        SizedBoxes.box16height,
      ],
    );
  }
}
