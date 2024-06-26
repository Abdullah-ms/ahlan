import 'package:ahlan/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding.dart';
import 'core/localization/changeLocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LangController controller = Get.put(LangController());
    return GetMaterialApp(
      initialBinding: MyBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Ahlan',
      translations: MyTranslation(),
      theme: controller.appTheme,
      getPages: myGetPages,
    );
  }
}

