import 'package:bundtask/Constants/TextStylesConstants.dart';
import 'package:bundtask/Presentation/Widgets/WhatYouGetCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/DataModels.dart';
import '../Widgets/ConditionsCard.dart';

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
      bottomNavigationBar: Container(
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
                children: [
                  Image.asset("assets/images/home-2.png"),
                  SizedBox(
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
              onPressed: () {},
              icon: Column(
                children: [
                  Image.asset("assets/images/investment.png"),
                  SizedBox(
                    height: 3,
                  ),
                  const Text(
                    "Investment",
                    style: Styles.style12,
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
                children: [
                  Image.asset("assets/images/message.png"),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Chat",
                    style: Styles.style12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    company.name,
                                    style: Styles.style23Bold,
                                  ),
                                  Text(
                                    company.category,
                                    style: Styles.style23,
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 8.0),
                                      backgroundColor: Colors.grey[200],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.arrow_right_alt,
                                              color: Colors.grey,
                                              size: 16.0,
                                            ),
                                            Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Icon(Icons.arrow_right_alt,
                                                  size: 16.0),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 2.0),
                                        Text(
                                          "Start Now",
                                          style: Styles.style13,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(company.image,fit: BoxFit.fill , width: MediaQuery.of(context).size.width/3),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        buildIndicators(),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Conditions",
                                  style: Styles.style16Bold,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Wrap(
                              spacing: MediaQuery.of(context).size.width/35,
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
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          children: [
                            Text(
                              "What You Get",
                              style: Styles.style16Bold,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Wrap(
                          spacing: MediaQuery.of(context).size.width/40,
                          runSpacing: 16,
                          direction: Axis.horizontal,
                          children: [
                            for (WhatYouGet whatYouGet in company.whatYouGet)
                              WhatYouGetCard(
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

  Widget buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.companies.length, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey,
          ),
        );
      }),
    );
  }
}
