import 'package:bundtask/ApiServices/CompaniesService.dart';
import 'package:bundtask/Presentation/Screens/HomeScreen.dart';
import 'package:bundtask/main.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../Constants/SizedBoxesConstants.dart';
import '../../Constants/TextStylesConstants.dart';
import '../../data/models/CompanyModels.dart';
import 'ConditionsCard.dart';
import 'OurCustomIndicator.dart';
import 'WhatYouGetCard.dart';

class BankCardWidget extends StatefulWidget {
  const BankCardWidget({
    super.key,
    required this.buttonCarouselController,
    required this.companies,
    required this.currentPage,
  });

  final CarouselController buttonCarouselController;
  final List<Company> companies;
  final int currentPage;

  @override
  State<BankCardWidget> createState() => _BankCardWidgetState();
}

class _BankCardWidgetState extends State<BankCardWidget> {
  late int currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = widget.currentPage;
  }

  Future<void> _refresh() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CarouselSlider(
        carouselController: widget.buttonCarouselController,
        options: CarouselOptions(
          enlargeCenterPage: true,
          height: double.infinity,
          onPageChanged: (index, reason) {
            setState(() {
              currentPage = index;
            });
          },
        ),
        items: widget.companies.map((company) {
          return Builder(
            builder: (BuildContext context) {
              return RefreshIndicator(
                onRefresh: _refresh,
                color: Colors.green,
                child: ListView(
                  children: [
                    Container(
                      width: MyApp.screenWidth,
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
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.grey[200],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 8),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              "assets/images/arrow-2.png"),
                                          SizedBoxes.box4width,
                                          const Text(
                                            "Start Now",
                                            style: Styles.style13,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          Image.asset(
                            company.image,
                            fit: BoxFit.fill,
                            width: MyApp.screenWidth / 3,
                          ),
                        ],
                      ),
                    ),
                    SizedBoxes.box10height,
                    OurCustomIndicator(
                      companies: widget.companies,
                      currentPage: currentPage,
                    ),
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
                          spacing: MyApp.screenWidth / 35,
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
                      spacing: MyApp.screenWidth / 40,
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
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
