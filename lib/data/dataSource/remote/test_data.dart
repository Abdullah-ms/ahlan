
import '../../../core/classes/crud.dart';
import '../../../linkAPIs.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getTestData() async {
    var response = await crud.postRequest(AppLinks.test, {});
    return response.fold((l) => l, (r) => r);
  }
}
