import 'package:get/get.dart';

import '../core/classes/statusRequest.dart';
import '../core/functions/handlingData.dart';
import '../core/services/services.dart';
import '../data/dataSource/remote/items_data.dart';

abstract class FaqsController extends GetxController {
  getData();
}

class FaqsControllerImp extends FaqsController {
  ItemsData itemsData = ItemsData(Get.find());

  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  List faqsList = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getFaqsData();
    // print("=========================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        faqsList.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.noData;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
