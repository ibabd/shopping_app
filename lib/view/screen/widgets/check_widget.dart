import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/auth_controller.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';

class CheckBoxWidget extends StatelessWidget {
   CheckBoxWidget({Key? key}) : super(key: key);
  final controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder:(_)=> Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child:controller.isCheckBox?
              Get.isDarkMode? Image.asset('assets/images/check.png'):const Icon(Icons.done,color: pinkClr,):Container(),

              //الاصل كد
             /* child:controller.isCheckBox?
               Image.asset('assets/images/check.png'):Container(),*/

            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                text: 'I accept ',
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
              TextUtils(
                text: 'terms & conditions',
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
