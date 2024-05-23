import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_Controller.dart';
import '../../../core/constants/colors.dart';

class BannerCard extends GetView<HomeControllerImp> {

  final String image;

  const BannerCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.fill,
            height: 250, width: double.infinity,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
