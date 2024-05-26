import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/itemsController.dart';
import '../../../core/constants/colors.dart';
import '../../../data/model/categoriesModel.dart';
import '../../../linkAPIs.dart';

class ListOfItemsPageCategories extends GetView<ItemsControllerImp> {
  const ListOfItemsPageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 15,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoriesUsingModel(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class CategoriesUsingModel extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;

  const CategoriesUsingModel(
      {super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         controller.changeCat(i!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(builder: (controller) => Row(
            children: [
              i == controller.selectedCat ? Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 80,
                width: 80,
                child: SvgPicture.network(
                  "${AppLinks.imagesCategories}/${categoriesModel.categoriesImage}",
                  color: AppColors.white,
                ),
              ) : Container(
                decoration: BoxDecoration(
                    color:Colors.grey[400],
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 60,
                width: 60,
                child: SvgPicture.network(
                  "${AppLinks.imagesCategories}/${categoriesModel.categoriesImage}",
                  color: AppColors.white,
                ),
              ),
            ],
          ),),
        ],
      ),
    );
  }
}
