import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/setting_controller.dart';
import 'package:shopping_app/utils/constant.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class LanguageWidget extends StatelessWidget {
   LanguageWidget({Key? key}) : super(key: key);
  final controller=Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder:(_)=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
        color: Colors.transparent,
         child: Row(
          children: [
            Container(
              padding:const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: languageSettings,
              ),
              child: const Icon(
                Icons.language,
                color:Colors.white ,
              ),
            ),
            const SizedBox(width: 20,),
            TextUtils(
              text: 'Language'.tr,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Get.isDarkMode?Colors.white:Colors.black,
              underLine: TextDecoration.none,
            ),
          ],
        ),
      ),
          Container(
            width: 120,
            padding:const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: Get.isDarkMode?Colors.white:Colors.black,
                width: 2,
              ),
            ),
            //علشان امنع الخط تحت اللغه والعلم
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconSize: 25,
                icon: Icon(Icons.arrow_drop_down,
                color: Get.isDarkMode?Colors.white:Colors.black,
                ),
                items:  [
                  DropdownMenuItem(
                      child:Text(
                          english,
                        style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    value: ene,
                  ),
                  DropdownMenuItem(
                    child:Text(
                      arabic,
                      style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: ara,
                  ),
                  DropdownMenuItem(
                    child:Text(
                      french,
                      style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: frf,
                  ),
                ],
                value: controller.langLocal,
                onChanged: (value){
                 controller.changeLanguage(value!);
                  Get.updateLocale(Locale(value));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
