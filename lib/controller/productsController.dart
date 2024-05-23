import 'package:get/get.dart';
import '../core/classes/statusRequest.dart';
import '../core/services/services.dart';
import '../data/model/itemsModel.dart';

abstract class ProductController extends GetxController {
  initialData();
}

class ProductControllerImp extends ProductController {

  late ItemsModel itemsModel;

  late StatusRequest statusRequest;

  // ال MyServices معمول له حقن لذلك فقط نعمل find
  MyServices myServices = Get.find();

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    // lang = myServices.sharedPreferences.getString("lang");
    itemsModel = Get.arguments["itemsModel"];
    statusRequest = StatusRequest.success;
    update();
  }


  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
