import 'package:flutter/material.dart';

import '../../Constants/SizedBoxesConstants.dart';
import '../../Constants/TextStylesConstants.dart';
import 'CustomCalculationIcons.dart';
import 'TermSelectionWidget.dart';

class InvestmentCalculatorWidget extends StatelessWidget {
  const InvestmentCalculatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      padding: EdgeInsets.all(20),
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
              IconButton(
                  onPressed: () {},
                  icon: const CustomCalculationIcons(
                    icon: Icons.remove,
                  )),
              const Text(
                "\$10,000",
                style: Styles.style36,
              ),
              IconButton(
                onPressed: () {},
                icon: const CustomCalculationIcons(
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
