import 'dart:async';

import 'package:flutter/material.dart';

import '../../Constants/SizedBoxesConstants.dart';
import '../../Constants/TextStylesConstants.dart';
import 'CustomCalculationIcons.dart';
import 'TermSelectionWidget.dart';

class InvestmentCalculatorWidget extends StatefulWidget {
  const InvestmentCalculatorWidget({
    super.key,
  });

  @override
  State<InvestmentCalculatorWidget> createState() =>
      _InvestmentCalculatorWidgetState();
}

class _InvestmentCalculatorWidgetState
    extends State<InvestmentCalculatorWidget> {
  double investmentAmount = 10000;
  Timer? incrementTimer;
  bool isUserPress = false;

  @override
  void dispose() {
    incrementTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Investment Amount",
            style: Styles.style12Investment,
          ),
          SizedBoxes.box10height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (investmentAmount > 10000 &&
                        investmentAmount - 10000 > 250) {
                      investmentAmount -= 10000;
                    } else if (investmentAmount > 250 &&
                        investmentAmount - 1000 > 250) {
                      investmentAmount -= 1000;
                    } else {
                      investmentAmount = 250;
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Center(
                            child: Text("250\$ is the least amount"),
                          ),
                        ),
                      );
                    }
                  });
                },
                onLongPress: () {
                  setState(() {
                    isUserPress = true;
                  });
                  if (isUserPress) {
                    incrementTimer =
                        Timer.periodic(const Duration(seconds: 2), (timer) {
                      setState(() {
                        if (investmentAmount > 250 &&
                            investmentAmount - 1000 > 250) {
                          investmentAmount -= 1000;
                        }
                      });
                    });
                  }
                },
                onLongPressEnd: (_) {
                  print("onEnd");
                  setState(() {
                    isUserPress = false;
                    incrementTimer?.cancel();
                  });
                },
                /*onLongPressDown: (_) {
                  print("onDown");
                  setState(() {
                    isUserPress = false;
                    incrementTimer?.cancel();
                  });
                },*/
                /*onLongPressUp: () {
                  print("onUp");
                  setState(() {
                    isUserPress = false;
                    incrementTimer?.cancel();
                  });
                },*/
                /*onLongPressCancel: () {
                  print("onCancel");
                  setState(() {
                    isUserPress = false;
                    incrementTimer?.cancel();
                  });
                },*/
                child: const CustomCalculationIcons(
                  icon: Icons.remove,
                ),
              ),
              Text(
                "\$${investmentAmount.toStringAsFixed(2)}",
                style: Styles.style36,
              ),
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    isUserPress = true;
                  });
                  if (isUserPress) {
                    incrementTimer =
                        Timer.periodic(const Duration(seconds: 2), (timer) {
                      setState(() {
                        investmentAmount += 1000;
                      });
                    });
                  }
                },
                onLongPressEnd: (_) {
                  print("onEnd");
                  setState(() {
                    isUserPress = false;
                    incrementTimer?.cancel();
                  });
                },
                onTap: () {
                  setState(() {
                    if (investmentAmount > 10000) {
                      investmentAmount += 10000;
                    } else {
                      investmentAmount += 1000;
                    }
                  });
                },
                child: const CustomCalculationIcons(
                  icon: Icons.add,
                ),
              ),
            ],
          ),
          SizedBoxes.box9height,
          Container(
            padding: const EdgeInsets.all(5),
            decoration: ShapeDecoration(
              color: const Color(0x1946AF35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  4,
                ),
              ),
            ),
            child: const Text(
              "6.81% YTM",
              style: Styles.style13Green,
            ),
          ),
          SizedBoxes.box20height,
          TermSelectionWidget(),
          SizedBoxes.box20height,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Capital At Maturity",
                style: Styles.style12Investment,
              ),
              Text(
                "Total Interest",
                style: Styles.style12Investment,
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$10,681",
                style: Styles.style22Rating,
              ),
              Text(
                "\$681",
                style: Styles.style22Rating,
              ),
            ],
          ),
          SizedBoxes.box5height,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Annual Interest",
                style: Styles.style12Investment,
              ),
              Text(
                "Average Maturity Date ",
                style: Styles.style12Investment,
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$68.1",
                style: Styles.style22Rating,
              ),
              Text(
                "2026",
                style: Styles.style22Rating,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
