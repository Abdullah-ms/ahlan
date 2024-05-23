import 'package:ahlan/core/classes/handlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/customerController.dart';
import '../widgets/home/customHomeTitle.dart';
import '../widgets/ourCustomers/customCustomerCard.dart';

class OurCustomers extends StatelessWidget {
  const OurCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CustomerControllerImp());
    return GetBuilder<CustomerControllerImp>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      child: ListView(children: [
        CustomHomeTitle(
          title: ' Our Customers',
        ),
        SizedBox(
          height: 15,
        ),
        CustomCustomerCard()
      ]),
    )),);
  }
}
