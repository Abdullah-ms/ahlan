import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/setting_controller.dart';
import '../../core/constants/colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controllerImp = Get.put(SettingControllerImp());
    return Container(
      child: ListView(children: [
         Stack(
           clipBehavior: Clip.none,
           children : [
             Container(height: 250, width: double.infinity,decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))),),
             Positioned(
               top: 75,
               left : 71,
               child:
               Container(
                 height: 60,width: 60,
                 child: SvgPicture.asset(
                   "assets/images/logo.svg",
                   color: Colors.deepOrange,
                   height: 30,
                   width: 30,
                 ),
               ),),
             Positioned(
               top: 60,
               left : Get.width/3,
               child:
               Column(
                 children: [
                   Text(
                     "1".tr,
                     style: TextStyle(
                         color: AppColors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 50),
                   ),
                   Text('11'.tr , style: TextStyle(color: AppColors.white),)
                 ],
               ),)
           ]
         ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text("4".tr),
                  trailing: Switch(value: true, onChanged: (val) {}),
                ),
                Divider(color: AppColors.primaryColor),
                ListTile(
                  title: Text("6".tr),
                  trailing: Icon(Icons.info_outline,color: AppColors.primaryColor,),
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('6'.tr),
                          content: Text('7'.tr),
                        )
                    );
                  },
                ),
                Divider(color: AppColors.primaryColor),
                ListTile(
                  title: Text("8".tr),
                  trailing: Icon(Icons.support_agent_outlined,color: AppColors.primaryColor,),
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('8'.tr),
                          content: Text('10'.tr),
                        )
                    );
                  },
                ),
                Divider(color: AppColors.primaryColor),
                ListTile(
                  title: Text("9".tr),
                  trailing: Icon(
                    Icons.language,
                    color: AppColors.primaryColor,
                  ),
                  onTap: () {
                    controllerImp.changeLang();
                  },
                ),
                Divider(color: AppColors.thirdColor),
                TextButton.icon(onPressed: () async  {
                  final Uri call = Uri(
                    scheme: 'tel',
                    path: '+80080001', // your desired phone number
                  );
                  if (await canLaunchUrl(call)){
                    await launchUrl(call);
                  }
                }, icon: Icon(Icons.call , color: AppColors.green,),
                  label: Text("Call us"),
                ),
                Divider(color: AppColors.thirdColor),
                TextButton.icon(onPressed: () async  {
                  final Uri call = Uri(
                    scheme: 'mailto',
                    path: 'mailto:<sales@earthlink.iq>?', // your desired phone number
                  );
                  if (await canLaunchUrl(call)){
                    await launchUrl(call);
                  }
                }, icon: Icon(Icons.email , color: AppColors.green,),
                  label: Text("Send email"),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
