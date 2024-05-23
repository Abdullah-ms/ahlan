import 'package:get/get.dart';

import '../core/classes/statusRequest.dart';
import '../core/functions/handlingData.dart';
import '../core/services/services.dart';
import '../data/dataSource/remote/items_data.dart';

abstract class CustomerController extends GetxController {
  getData();
}

class CustomerControllerImp extends CustomerController {
  ItemsData itemsData = ItemsData(Get.find());

  MyServices myServices = Get.find();

  late StatusRequest statusRequest;

  List customersList = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getCustomersData();
    // print("=========================================$response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        customersList.addAll(response['data']);
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
