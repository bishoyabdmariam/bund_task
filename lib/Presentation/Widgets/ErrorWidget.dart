import 'package:flutter/material.dart';

class ErrorWidgetHandle extends StatelessWidget {
  const ErrorWidgetHandle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          "Sorry but there is a problem , Please Contact Us on 01202089993",
          style: TextStyle(fontSize: 20),

        ),
      ),
    );
  }
}
