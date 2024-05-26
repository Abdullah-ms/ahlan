import 'package:ahlan/data/model/faqsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/faqs_controller.dart';
import '../../core/classes/handlingDataView.dart';
import '../../core/constants/colors.dart';
import '../widgets/faqs/customFAQsCard.dart';
import '../widgets/home/customHomeTitle.dart';

class FAQs extends StatelessWidget {
  const FAQs({super.key});

  @override
  Widget build(BuildContext context) {
    FaqsControllerImp controller = Get.put(FaqsControllerImp());
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      child: ListView(
        children: [
          CustomHomeTitle(title: "5".tr),
          GetBuilder<FaqsControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.separated(
                itemCount: controller.faqsList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomFAQsList(
                        faqsModel:
                            FaqsModel.fromJson(controller.faqsList[index]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
