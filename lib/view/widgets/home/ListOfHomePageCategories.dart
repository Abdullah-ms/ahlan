import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/home_Controller.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translateDatabase.dart';
import '../../../data/model/categoriesModel.dart';
import '../../../linkAPIs.dart';


class ListOfHomePageCategories extends GetView<HomeControllerImp> {
  const ListOfHomePageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height : Get.height/1.45 ,
      // height: 600,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.dataCategories.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CategoriesUsingModel(
                i : index ,
                categoriesModel:
                    CategoriesModel.fromJson(controller.dataCategories[index]),
              ),
              SizedBox(height: 5,),
            ],
          );
        },
      ),
    );
  }
}

class CategoriesUsingModel extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i ;
  const CategoriesUsingModel({super.key, required this.categoriesModel , required this.i});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.25,
      color: AppColors.white,
      child: InkWell(
        onTap: (){
          controller.goToItems(controller.dataCategories, i!);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 70,
                width: 70,
                child: SvgPicture.network(
                  "${AppLinks.imagesCategories}/${categoriesModel.categoriesImage}",
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: 10,),
              Flexible(
                child: Text(
                  overflow: TextOverflow.visible,
                  "${translateDatabase(categoriesModel.categoriesName , categoriesModel.categoriesNameAr)}",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 20 , fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
