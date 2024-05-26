import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/itemsController.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translateDatabase.dart';
import '../../../data/model/itemsModel.dart';
import '../../../linkAPIs.dart';

class CustomItemsList extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomItemsList({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.25,
      color: AppColors.white,
      child: InkWell(
        onTap: () {
          controller.goToProducts(itemsModel);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Hero(
                tag: "${itemsModel.itemsId}",
                child: CachedNetworkImage(
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                  imageUrl: "${AppLinks.imagesItems}/${itemsModel.itemsImages}",
                  /*placeholder: (context, url) =>
                  const CircularProgressIndicator(),*/
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Text(
                  overflow: TextOverflow.visible,
                  "${translateDatabase(itemsModel.itemsName, itemsModel.itemsNameAr)}",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
