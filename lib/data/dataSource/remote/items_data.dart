
import '../../../core/classes/crud.dart';
import '../../../linkAPIs.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getItemsData(int id ) async {
    var response = await crud.postRequest(AppLinks.items, {
      // من الضروري تحويله الى string لان نوع الركوست بالبك ايند هو string
      "id" : id.toString() ,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCustomersData() async {
    var response = await crud.postRequest(AppLinks.customers, {});
    return response.fold((l) => l, (r) => r);
  }

  getFaqsData() async {
    var response = await crud.postRequest(AppLinks.faqs, {});
    return response.fold((l) => l, (r) => r);
  }

}
