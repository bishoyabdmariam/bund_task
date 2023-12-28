import 'package:bundtask/Constants/SizedBoxesConstants.dart';
import 'package:bundtask/Constants/TextStylesConstants.dart';
import 'package:bundtask/Presentation/Widgets/WhatYouGetCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/DataModels.dart';
import '../Widgets/ConditionsCard.dart';
import '../Widgets/CustomNavigationBottomBar.dart';
import '../Widgets/OurCustomIndicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.companies}) : super(key: key);

  final List<Company> companies;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: const CustomNavigationBottomBar(),
      appBar: buildCustomAppBar(),
      body: Column(
        children: [
          SizedBoxes.box10height,
          Expanded(
            child: CarouselSlider(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: double.infinity,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              items: widget.companies.map((company) {
                return Builder(
                  builder: (BuildContext context) {
                    return ListView(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBoxes.box10height,
                                  Text(
                                    company.name,
                                    style: Styles.style23Bold,
                                  ),
                                  Text(
                                    company.category,
                                    style: Styles.style23,
                                  ),
                                  SizedBoxes.box18height,
                                  IconButton(
                                      onPressed: () {},
                                      icon: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[200],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 8),
                                          child: Row(
                                            children: [
                                              Image.asset("assets/images/arrow-2.png"),
                                              SizedBoxes.box4width,
                                              const Text(
                                                "Start Now",
                                                style: Styles.style13,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                              Image.asset(company.image,
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width / 3),
                            ],
                          ),
                        ),
                        SizedBoxes.box10height,
                        OurCustomIndicator(
                            widget: widget, currentPage: _currentPage),
                        SizedBoxes.box10height,
                        Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "Conditions",
                                  style: Styles.style16Bold,
                                ),
                              ],
                            ),
                            SizedBoxes.box16height,
                            Wrap(
                              spacing: MediaQuery.of(context).size.width / 35,
                              runSpacing: 16,
                              children: [
                                for (Condition condition in company.conditions)
                                  ConditionsCard(
                                    image: condition.image,
                                    text: condition.text,
                                  ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBoxes.box14height,
                        const Row(
                          children: [
                            Text(
                              "What You Get",
                              style: Styles.style16Bold,
                            ),
                          ],
                        ),
                        SizedBoxes.box16height,
                        Wrap(
                          spacing: MediaQuery.of(context).size.width / 40,
                          runSpacing: 16,
                          direction: Axis.horizontal,
                          children: [
                            for (WhatYouGet whatYouGet in company.whatYouGet)
                              WhatYouGetCard(
                                isEnabled: whatYouGet.isEnabled,
                                image: whatYouGet.image,
                                text: whatYouGet.text,
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildCustomAppBar() {
    return AppBar(
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
            icon: Image.asset("assets/images/user.png"),
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
    );
  }
}
