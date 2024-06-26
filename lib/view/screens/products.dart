import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/productsController.dart';
import '../../core/classes/handlingDataView.dart';
import '../../core/constants/colors.dart';
import '../../core/functions/translateDatabase.dart';
import '../widgets/products/topProductStackDetails.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(onPressed: () async  {
                final Uri call = Uri(
                  scheme: 'tel',
                  path: '+80080001', // your desired phone number
                );
                if (await canLaunchUrl(call)){
                  await launchUrl(call);
                }
              }, icon: Icon(Icons.call , color: AppColors.green,),
              label: Text("Call us"),
              ),
              TextButton.icon(onPressed: () async  {
                final Uri call = Uri(
                  scheme: 'mailto',
                  path: 'mailto:<sales@earthlink.iq>?', // your desired phone number
                );
                if (await canLaunchUrl(call)){
                  await launchUrl(call);
                }
              }, icon: Icon(Icons.email , color: AppColors.green,),
                label: Text("Send email"),
              ),
            ],
          ),
        ),
        body: GetBuilder<ProductControllerImp>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  const TopProductStackDetails(),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${translateDatabase(controller.itemsModel.itemsName, controller.itemsModel.itemsNameAr)}",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: AppColors.primaryColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${translateDatabase(controller.itemsModel.itemsDesc, controller.itemsModel.itemsDescAr)}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.blackIntermediate),
                        ),
/*                const SizedBox(
                  height: 10,
                ),
                Text(
                  "sauce",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: AppColors.secondaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SubItemsList()*/
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
