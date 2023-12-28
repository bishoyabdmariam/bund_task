import 'package:flutter/material.dart';

import '../Screens/HomeScreen.dart';
class OurCustomIndicator extends StatelessWidget {
  const OurCustomIndicator({
    super.key,
    required this.widget,
    required int currentPage,
  }) : _currentPage = currentPage;

  final HomeScreen widget;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.companies.length, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.black : Colors.grey,
          ),
        );
      }),
    );
  }
}
