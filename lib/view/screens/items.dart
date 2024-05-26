import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/itemsController.dart';
import '../../core/classes/handlingDataView.dart';
import '../../data/model/itemsModel.dart';
import '../widgets/customAppBar.dart';
import '../widgets/items/ListOfItemsPageCategories.dart';
import '../widgets/items/customItemsList.dart';
import 'home_page.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 7),
        child: ListView(
          children: [
            CustomAppBar(
                titleAppBar: '2'.tr,
                onPressedSearch: () {
                  controller.onPressSearchButton();
                },
                myController: controller.search,
                onChanged: (val) {
                  controller.checkSearch(val);
                }
            ),
            const SizedBox(
              height: 20,
            ),
            const ListOfItemsPageCategories(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch == false
                      ? ListView.separated(
                    itemCount: controller.itemsList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context , index){
                        return Column(
                          children: [
                            CustomItemsList(
                              itemsModel:
                              ItemsModel.fromJson(controller.itemsList[index]),
                            ),
                            SizedBox(height: 5,),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(
                      width: 10,
                    ),
                      ):SearchPage(
                    comingSearchItems: controller.searchItemsList,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
