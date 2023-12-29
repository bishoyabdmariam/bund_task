import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    super.key,
    required this.emptyMSG,
  });

  final String emptyMSG;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        emptyMSG,
      ),
    );
  }
}
