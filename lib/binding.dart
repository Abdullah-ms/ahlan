import 'package:get/get.dart';
import 'core/classes/crud.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
   // Get.lazyPut(() => SignUpControllerImp() , fenix: true);
    Get.put(Crud());
  }
}