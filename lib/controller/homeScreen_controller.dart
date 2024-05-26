import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../view/screens/faqs.dart';
import '../view/screens/home_page.dart';
import '../view/screens/our_customers.dart';
import '../view/screens/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int indexOfPage);
  shareLink();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> pagesList = [
    HomePage(),
    OurCustomers(),
    FAQs(),
    Settings(),
  ];

  List iconsList = [
    {
      //"title": "Home",
      "icon": Icons.home_outlined,
    },
    {
      //"title": "Categories",
      "icon": Icons.group_add_outlined,
    },
    {
      //"title": "Orders",
      "icon": Icons.chat_outlined,
    },
    {
      //"title": "Setting",
      "icon": Icons.settings_outlined,
    },
  ];

  void shareLink() {
  Share.share('https://www.mediafire.com/file/sszxh8p4skgci5m/Ahlan.apk/file' , subject: "حمل تطبيق 'اهلا'");
  }


  @override
  changePage(int indexOfPage) {
    currentPage = indexOfPage;
    update();
  }
}
