import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/setting_controller.dart';
import 'package:shopping_app/logic/controller/theme_controller.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class DarkModeWidget extends StatelessWidget {
   DarkModeWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),
        Switch(
            activeColor:Get.isDarkMode?pinkClr: mainColor,
            activeTrackColor:Get.isDarkMode?pinkClr: mainColor,
            value:controller.switchValue.value , onChanged: (value){
          ThemeController().changesTheme();
          controller.switchValue.value=value;
        }),
      ],
    ),
    );
  }

 Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding:const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color:Colors.white ,
            ),
          ),
          const SizedBox(width: 20,),
          TextUtils(
              text: 'Dark Mode'.tr,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Get.isDarkMode?Colors.white:Colors.black,
              underLine: TextDecoration.none,
          ),
        ],
      ),
    );
 }
}
