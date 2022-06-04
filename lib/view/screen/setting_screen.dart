import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/setting/dark_mode_setting.dart';
import 'package:shopping_app/view/screen/widgets/setting/language_widget.dart';
import 'package:shopping_app/view/screen/widgets/setting/logout_widget.dart';
import 'package:shopping_app/view/screen/widgets/setting/profile_widget.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class SettingScreen extends StatelessWidget {
   const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding:const EdgeInsets.all(24),
        children: [
           ProfileWidget(),
          const SizedBox(height: 10,),
          Divider(
            color: Get.isDarkMode?Colors.white:Colors.grey,
            thickness: 2,
          ),
          const SizedBox(height: 20,),
           TextUtils(
              text: 'GENERAL'.tr,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color:Get.isDarkMode?pinkClr: mainColor,
             underLine: TextDecoration.none,
          ),
          const SizedBox(height: 20,),
           DarkModeWidget(),
          const SizedBox(height: 20,),
           LanguageWidget(),
          const SizedBox(height: 20,),
           LogOutWidget(),

        ],
      ),
      // body:  Center(
      //   child: Column(
      //     children: [
      //       TextButton(
      //         onPressed: (){
      //           ThemeController().changeTheme();
      //         },
      //         child: Text("Dark Mode",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black),),
      //       ),
      //       const SizedBox(height:20 ,),
      //       TextButton(
      //         onPressed: (){
      //         Get.defaultDialog(
      //             title: "Logout From App",
      //             titleStyle:const TextStyle(
      //               fontSize: 18,
      //               color: Colors.black,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           middleText: 'Are you sure you need to logOut',
      //           middleTextStyle: const TextStyle(
      //             fontSize: 18,
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold,
      //           ),
      //           backgroundColor: Colors.grey,
      //           radius: 10,
      //           textCancel: " No ",
      //           cancelTextColor: Colors.white,
      //           textConfirm: " Yes",
      //           confirmTextColor: Colors.white,
      //           onCancel: (){
      //               Get.back();
      //           },
      //           onConfirm: (){
      //               AuthController.instance.logOut();
      //           },
      //           buttonColor:Get.isDarkMode? pinkClr:mainColor,
      //
      //         );
      //         },
      //         child: Text("LogOut",style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black),),
      //       ),
      //     ],
      //   )
      // ),
    );
  }
}
