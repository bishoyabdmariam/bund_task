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

  double annualYieldToMaturity = .0681; // Replace with your actual value

  int selectedTerm = 3;

  @override
  void dispose() {
    incrementTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadInvestmentAmount();
    loadSelectedTerm();
  }

  Future<void> loadSelectedTerm() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getBool("isFirstContainerPressed") == null ||
          preferences.getBool("isFirstContainerPressed") == true) {
        selectedTerm = 3;
      } else {
        selectedTerm = 5;
      }
    });
  }

  // Load investment amount from SharedPreferences
  Future<void> loadInvestmentAmount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      investmentAmount = preferences.getInt('investmentAmount') ?? 10000;
    });
  }

  // Save investment amount to SharedPreferences
  Future<void> saveInvestmentAmount(int amount) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('investmentAmount', amount);
  }

  @override
  Widget build(BuildContext context) {
    double capitalAtMaturity =
        (investmentAmount * annualYieldToMaturity * selectedTerm) +
            investmentAmount;
    double totalInterest =
        annualYieldToMaturity * selectedTerm * investmentAmount;
    double annualInterest = investmentAmount * annualYieldToMaturity;
    int averageMaturityDate = DateTime.now().year + selectedTerm;
    loadSelectedTerm();

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
                    });
                  }
                },
                onLongPressEnd: (_) {
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
                        if (investmentAmount > 10000) {
                          investmentAmount += 10000;
                        } else {
                          investmentAmount += 1000;
                        }
                      });
                    });
                  }
                },
                onLongPressEnd: (_) {
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
          const TermSelectionWidget(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${capitalAtMaturity.toStringAsFixed(0)}",
                style: Styles.style22Rating,
              ),
              Text(
                "\$${totalInterest.toStringAsFixed(0)}",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${annualInterest.toStringAsFixed(0)}",
                style: Styles.style22Rating,
              ),
              Text(
                averageMaturityDate.toString(),
                style: Styles.style22Rating,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
