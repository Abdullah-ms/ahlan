import 'package:ahlan/view/screens/faqs.dart';
import 'package:ahlan/view/screens/homeScreen.dart';
import 'package:ahlan/view/screens/language.dart';
import 'package:ahlan/view/screens/products.dart';
import 'package:ahlan/view/screens/items.dart';
import 'package:ahlan/view/screens/settings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'core/constants/appRoutesNames.dart';
import 'core/middleware/middlewareOne.dart';

List<GetPage<dynamic>>? myGetPages = [
  GetPage( name: "/", page: () => const Language(), middlewares: [MiddleWareOne()]),
  GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.items, page: () => const Items()),
  GetPage(name: AppRoutes.products, page: () => const Products()),
  GetPage(name: AppRoutes.setting, page: () => const Settings()),
  GetPage(name: AppRoutes.faqs, page: () => const FAQs()),

];