import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/appRoutesNames.dart';
import '../../core/localization/changeLocal.dart';
import '../../core/services/services.dart';
import '../widgets/language/customButtonLang.dart';

class Language extends GetView<LangController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {

    MyServices myServices = Get.find<MyServices>();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "اختر اللغة".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 30),
            CustomButtonLang(
              textButton: 'العربية'.tr,
              onPressed: () {
                myServices.sharedPreferences.setString("step", "2");
                controller.changeLang("ar");
                Get.offAllNamed(AppRoutes.homePage);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButtonLang(
              textButton: 'English'.tr,
              onPressed: () {
                myServices.sharedPreferences.setString("step", "2");
                controller.changeLang("en");
                Get.offAllNamed(AppRoutes.homePage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
