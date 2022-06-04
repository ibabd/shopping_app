import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/auth_controller.dart';
import 'package:shopping_app/logic/controller/setting_controller.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class ProfileWidget extends StatelessWidget {
   ProfileWidget({Key? key}) : super(key: key);
  final controller=Get.find<SettingController>();
   final authController=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Obx(()=> Row(
         children: [
           Container(
             height: 100,
             width: 100,
             decoration:  BoxDecoration(
                 color: Colors.white,
                 shape: BoxShape.circle,
                 image: DecorationImage(
                   image: NetworkImage(
                     authController.displayUserPhoto.value
                   ),
                   fit: BoxFit.cover,
                 ),
             ),
           ),
           const SizedBox(
             height: 15,
           ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               TextUtils(
                 text: controller.capitalize(authController.displayName.value),
                 fontWeight: FontWeight.bold,
                 fontSize: 22,
                 color: Get.isDarkMode?Colors.white:Colors.black,
                 underLine: TextDecoration.none,
               ),
               TextUtils(
                 text: authController.displayUserEmail.value,
                 fontWeight: FontWeight.bold,
                 fontSize: 14,
                 color: Get.isDarkMode?Colors.white:Colors.black,
                 underLine: TextDecoration.none,
               ),
             ],
           ),
         ],
       ),
       ),
      ],

    );
  }
}
