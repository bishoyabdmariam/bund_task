import 'package:bundtask/Constants/TextStylesConstants.dart';
import 'package:bundtask/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermSelectionWidget extends StatefulWidget {
  const TermSelectionWidget({super.key});

  @override
  _TermSelectionWidgetState createState() => _TermSelectionWidgetState();
}

class _TermSelectionWidgetState extends State<TermSelectionWidget> {
  late bool isFirstContainerPressed =true;

  @override
  void initState() {
    super.initState();
    // Load the selected term from SharedPreferences
    loadSelectedTerm();
  }

  // Load selected term from SharedPreferences
  Future<void> loadSelectedTerm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFirstContainerPressed =
          prefs.getBool('isFirstContainerPressed') ?? true;
    });
  }

  // Save selected term to SharedPreferences
  Future<void> saveSelectedTerm(bool isFirstPressed) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstContainerPressed', isFirstPressed);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: MyApp.screenHeight/22,
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
                  // Save the updated term selection
                  saveSelectedTerm(isFirstContainerPressed);
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
                  // Save the updated term selection
                  saveSelectedTerm(isFirstContainerPressed);
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
