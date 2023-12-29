import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

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
  int investmentAmount = 10000;
  Timer? incrementTimer;
  bool isUserPress = false;

  @override
  void dispose() {
    incrementTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadInvestmentAmount();
  }

  // Load investment amount from SharedPreferences
  Future<void> loadInvestmentAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      investmentAmount = prefs.getInt('investmentAmount') ?? 10000;
    });
  }

  // Save investment amount to SharedPreferences
  Future<void> saveInvestmentAmount(int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('investmentAmount', amount);
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
                  saveInvestmentAmount(investmentAmount);
                },
                onLongPress: () async {
                  setState(() {
                    isUserPress = true;
                  });
                  if (isUserPress) {
                    incrementTimer =
                        Timer.periodic(const Duration(seconds: 2), (timer) {
                      Vibration.vibrate();
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
                  saveInvestmentAmount(investmentAmount);
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
                "\$$investmentAmount",
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
                      Vibration.vibrate();
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
                  saveInvestmentAmount(investmentAmount);
                },
                onTap: () {
                  setState(() {
                    if (investmentAmount > 10000) {
                      investmentAmount += 10000;
                    } else {
                      investmentAmount += 1000;
                    }
                  });
                  saveInvestmentAmount(investmentAmount);
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
