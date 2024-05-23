import 'package:ahlan/controller/faqs_controller.dart';
import 'package:ahlan/data/model/faqsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/translateDatabase.dart';

class CustomFAQsList extends GetView<FaqsControllerImp> {
  final FaqsModel faqsModel;

  const CustomFAQsList({
    super.key,
    required this.faqsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.25,
      color: AppColors.white,
      child: ListTile(
        title: Text("${translateDatabase(faqsModel.faqsQuestion, faqsModel.faqsQuestionAr)}" , style: TextStyle(color: AppColors.primaryColor, fontSize: 18 ),),
        onTap: (){
          showDialog(

              context: context,
              builder: (_) => AlertDialog(
                title: Text("${translateDatabase(faqsModel.faqsQuestion, faqsModel.faqsQuestionAr)}"),
                content: Text("${translateDatabase(faqsModel.faqsAnswer, faqsModel.faqsAnswerAr)}" ),),
          );
        },
      ),
    );
  }
}
