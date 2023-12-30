import 'package:bundtask/Constants/SizedBoxesConstants.dart';
import 'package:bundtask/Constants/TextStylesConstants.dart';
import 'package:bundtask/Presentation/Widgets/ErrorWidget.dart';
import 'package:bundtask/Presentation/Widgets/LoadingWidget.dart';
import 'package:bundtask/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../ApiServices/CompaniesService.dart';
import '../../data/models/CompanyModels.dart';
import '../Widgets/BanKCardWidget.dart';
import '../Widgets/CustomNavigationBottomBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();
  final int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: const CustomNavigationBottomBar(),
      appBar: buildCustomAppBar(),
      body: FutureBuilder<List<Company>>(
        future: CompanyService.fetchCompanies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasError) {
            return const ErrorWidgetHandle();
          } else {
            List<Company> companies = snapshot.data ?? [];
            return Column(
              children: [
                SizedBoxes.box10height,
                BankCardWidget(
                  buttonCarouselController: buttonCarouselController,
                  companies: companies,
                  currentPage: _currentPage,
                ),
              ],
            );
          }
        },
      ),
    );
  }

  AppBar buildCustomAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[200],
      leadingWidth: MyApp.screenWidth / 4.8,
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
