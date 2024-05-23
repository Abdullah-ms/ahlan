import 'package:ahlan/core/constants/appRoutesNames.dart';
import 'package:get/get.dart';
import '../core/services/services.dart';

abstract class SettingController extends GetxController {
 changeLang();

}

class SettingControllerImp extends SettingController {
  // ال MyServices معمول له حقن لذلك فقط نعمل find
  MyServices myServices = Get.find();

  @override
  changeLang() {
    myServices.sharedPreferences.clear();
    Get.toNamed(AppRoutes.language);
  }

}
