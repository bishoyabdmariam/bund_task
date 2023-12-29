import 'dart:convert';

import 'package:bundtask/Constants/SizedBoxesConstants.dart';
import 'package:bundtask/Constants/TextStylesConstants.dart';
import 'package:bundtask/Presentation/Widgets/EmptyData.dart';
import 'package:bundtask/Presentation/Widgets/ErrorWidget.dart';
import 'package:bundtask/Presentation/Widgets/LoadingWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/models/BondsModel.dart';
import '../Widgets/CustomBondWidget.dart';
import '../Widgets/InvestmentCalculatorWidget.dart';
import '../Widgets/TermsTypesWidget.dart';

class InvestmentScreen extends StatefulWidget {
  const InvestmentScreen({super.key});

  @override
  State<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> {
  List<Bond> dummyBonds = [
    Bond(
      image: "assets/images/image 13.png",
      title: "Netflix INC",
      subTitle: "BBB",
      data: "5.37% APY",
    ),
    Bond(
      image: "assets/images/image 14.png",
      title: "Apple INC",
      subTitle: "BB+",
      data: "7.71% APY",
    ),
    Bond(
      image: "assets/images/image 15.png",
      title: "Ford Motor LLC",
      subTitle: "AA+",
      data: "4.85% APY",
    ),
    Bond(
      image: "assets/images/Intersect.png",
      title: "Morgan Stanley",
      subTitle: "A-",
      data: "6.27% APY",
    ),
  ];

  Future<List<Bond>> fetchData() async {
    Dio dio = Dio();
    String apiUrl = 'https://httpbin.org/anything';

    try {
      // Convert the list of Bond objects to a list of JSON maps
      List<Map<String, dynamic>> bondJsonList =
          dummyBonds.map((bond) => bond.toJson()).toList();

      // Make the HTTP POST request
      Response response = await dio.post(apiUrl, data: {'data': bondJsonList});

      // Parse the response and convert it back to a list of Bond objects
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('data')) {
        dynamic data = responseData['data'];
        if (data is String) {
          // Parse the data string
          List<dynamic> parsedData = jsonDecode(data)['data'];
          List<Bond> bonds = parsedData
              .map((json) => Bond.fromJson(json as Map<String, dynamic>))
              .toList();
          return bonds;
        } else {
          // Handle the case where the 'data' field is not a string
          print("Error: 'data' field is not a string");
          return [];
        }
      } else {
        // Handle the case where the 'data' field is missing
        print("Error: 'data' field is missing");
        return [];
      }
    } catch (error) {
      // Throw the error to be caught by the FutureBuilder
      print("Error: $error");
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(
          vertical: 11,
          horizontal: 18.5,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF1C2C56),
            // Set the text color
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8.0), // Adjust the border radius
            ),
          ),
          child: const Text(
            "Create Investment Account",
            style: Styles.style16White,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                scrolledUnderElevation: 0,
                backgroundColor: Colors.grey[100],
                title: const Text(
                  "Fixed Income",
                  style: Styles.style20,
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBoxes.box30height,
                    const Text(
                      "Fixed Income Portfolio",
                      style: Styles.style22,
                    ),
                    SizedBoxes.box5height,
                    const Text(
                      "A fixed income portfolio consists of bonds and other securities providing steady income and relatively lower risk.",
                      style: Styles.style14Bold,
                    ),
                    SizedBoxes.box30height,
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Annual Yield To Maturity (YTM) ",
                              style: Styles.style16BoldInfo,
                            ),
                            Icon(
                              Icons.info,
                            )
                          ],
                        ),
                        Text(
                          "6.81%",
                          style: Styles.style31,
                        ),
                        SizedBoxes.box5height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Average Rating",
                              style: Styles.style12Investment,
                            ),
                            Text(
                              "Bonds",
                              style: Styles.style12Investment,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "AA",
                              style: Styles.style22Rating,
                            ),
                            Text(
                              "20 Companies",
                              style: Styles.style22Rating,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBoxes.box5height,
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Term Types",
                          style: Styles.style12Investment,
                        ),
                        SizedBoxes.box10height,
                        Row(
                          children: [
                            TermsTypesWidget(
                              termType: "3 Year Term",
                            ),
                            SizedBoxes.box20width,
                            TermsTypesWidget(
                              termType: "5 Year Term",
                            ),
                          ],
                        ),
                        SizedBoxes.box30height,
                        Text(
                          "Investment Calculator",
                          style: Styles.style16Bold,
                        ),
                      ],
                    ),
                    SizedBoxes.box14height,
                    const InvestmentCalculatorWidget(),
                    SizedBoxes.box30height,
                    const Text(
                      "Bonds",
                      style: Styles.style16Bold,
                    ),
                    SizedBoxes.box14height,
                    /*for (var bond in dummyBonds)
                        CustomBondWidget(
                          image: bond.image,
                          title: bond.title,
                          subTitle: bond.subTitle,
                          data: bond.data,
                        ),*/
                    FutureBuilder<List<Bond>>(
                      future: fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Loading indicator while waiting for data
                          return const LoadingWidget();
                        } else if (snapshot.hasError) {
                          return const ErrorWidgetHandle();
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          // Handle empty or null data
                          return const EmptyData(
                              emptyMSG: "There is no Data Available");
                        } else {
                          // Build CustomBondWidget widgets based on the data
                          List<CustomBondWidget> bondWidgets = snapshot.data!
                              .map((bond) => CustomBondWidget(
                                    image: bond.image,
                                    title: bond.title,
                                    subTitle: bond.subTitle,
                                    data: bond.data,
                                  ))
                              .toList();

                          return Column(
                            children: bondWidgets,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
