import 'package:bundtask/Constants/TextStylesConstants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leadingWidth: 75,
        leading: Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
            top: 8.0,
            bottom: 8.0,
            left: 28.0,
          ),
          child: Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: Styles.style10,
            ),
            Text(
              "Mehemet Taser",
              style: Styles.style14Bold,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              top: 8.0,
              bottom: 8.0,
              right: 28.0,
            ),
            child: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                ),
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.notifications,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
      ),
    );
  }
}
