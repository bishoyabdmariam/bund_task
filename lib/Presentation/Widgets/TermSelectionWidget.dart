import 'package:bundtask/Constants/SizedBoxesConstants.dart';
import 'package:bundtask/Constants/TextStylesConstants.dart';
import 'package:flutter/material.dart';

class TermSelectionWidget extends StatefulWidget {
  @override
  _TermSelectionWidgetState createState() => _TermSelectionWidgetState();
}

class _TermSelectionWidgetState extends State<TermSelectionWidget> {
  bool isFirstContainerPressed = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: isFirstContainerPressed
                ? Border.all(color: Colors.black, width: 2.0)
                : null,
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                if (!isFirstContainerPressed) {
                  isFirstContainerPressed = !isFirstContainerPressed;
                }
              });
            },
            child: Text('3 Year Term',
                style: isFirstContainerPressed
                    ? Styles.style13
                    : Styles.style13YearsTerm),
          ),
        ),
        Container(
          height: 37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: !isFirstContainerPressed
                ? Border.all(color: Colors.black, width: 2.0)
                : null,
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                if (isFirstContainerPressed) {
                  isFirstContainerPressed = !isFirstContainerPressed;
                }
              });
            },
            child: Text('5 Year Term',
                style: !isFirstContainerPressed
                    ? Styles.style13
                    : Styles.style13YearsTerm),
          ),
        ),
      ],
    );
  }
}
