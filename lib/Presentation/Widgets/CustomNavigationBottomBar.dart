import 'package:bundtask/Presentation/Screens/InvestmentScreen.dart';
import 'package:flutter/material.dart';

import '../../Constants/TextStylesConstants.dart';
class CustomNavigationBottomBar extends StatelessWidget {
  const CustomNavigationBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/home-2.png",fit: BoxFit.cover,),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Home",
                  style: Styles.style12,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 9,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InvestmentScreen()));
            },
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/investment.png",fit: BoxFit.cover,),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Investment",
                  style: Styles.style12BottomNavBar,
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 9,
          ),
          IconButton(
            onPressed: () {},
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/message.png",fit: BoxFit.cover,),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Chat",
                  style: Styles.style12BottomNavBar,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
