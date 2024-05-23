import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/appRoutesNames.dart';
import '../services/services.dart';

class MiddleWareOne extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find<MyServices>();

  @override
  RouteSettings? redirect(String? route) {

    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homePage);
    }

    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.language);
    }
  }
}
