import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controller/homeScreen_controller.dart';
import '../../core/constants/colors.dart';
import '../widgets/home_Screen/complete_Custom_NavBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 2,
          title: Row(
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                color: Colors.deepOrange,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "1".tr,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none_outlined,
                color: AppColors.primaryColor,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.shareLink();
              },
              icon: Icon(
                Icons.share_outlined,
                color: AppColors.primaryColor,
                size: 25,
              ),
            )
          ],
        ),
        bottomNavigationBar: CompleteCustomNavBar(),
        body: controller.pagesList.elementAt(controller.currentPage),
      ),
    );
  }
}
