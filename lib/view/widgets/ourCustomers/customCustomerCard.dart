import 'package:ahlan/core/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controller/customerController.dart';
import '../../../core/functions/translateDatabase.dart';
import '../../../data/model/customerModels.dart';
import '../../../linkAPIs.dart';

class CustomCustomerCard extends GetView<CustomerControllerImp> {
  const CustomCustomerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items per row
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 1, // Width to height ratio of each item
      ),
      itemCount: controller.customersList.length,
      itemBuilder: (context, index) {
        return CustomersUsingModel(
          customersModel:
          CustomersModel.fromJson(controller.customersList[index]),
        );
      },
    );

  }
}

class CustomersUsingModel extends GetView<CustomerControllerImp> {
  final CustomersModel customersModel;

  const CustomersUsingModel({super.key, required this.customersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.25,
      color: AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            height: 80,
            width: 100,
            child: CachedNetworkImage(
              color: AppColors.primaryColor,
              height: 80,
              width: 80,
              fit: BoxFit.fill,
              imageUrl:
                  "${AppLinks.imagesCustomers}/${customersModel.customersImage}",
              /*placeholder: (context, url) =>
                  const CircularProgressIndicator(),*/
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Text("${translateDatabase(customersModel.customersName, customersModel.customersNameAr)}", overflow: TextOverflow.ellipsis ,  style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Row(
              children: [
                Expanded( flex: 1 , child: Icon(Icons.category_outlined , size: 15, color: AppColors.blackIntermediate,)),
                Expanded( flex: 4,
                  child: Text(
                    overflow: TextOverflow.visible,
                    "${translateDatabase(customersModel.customersCategory, customersModel.customersCategoryAr)}",
                    style: TextStyle(
                        color: AppColors.blackIntermediate,
                        fontSize: 14,),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
