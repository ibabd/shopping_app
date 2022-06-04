import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/cart_controller.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/cart_items.dart';
import 'package:shopping_app/view/screen/widgets/search_form_text.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final controller=Get.put(()=>CartController);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  color:Get.isDarkMode?darkGreyClr: mainColor,
                  borderRadius:const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const TextUtils(
                          text: 'Find Your',
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                          underLine: TextDecoration.none,
                      ),
                      const SizedBox(height: 5,),
                      const TextUtils(
                        text: 'INSPIRATION',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white,
                        underLine: TextDecoration.none,
                      ),
                      const SizedBox(height: 20,),
                      SearchFormText(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextUtils(
                      text: 'Categories',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color:Get.isDarkMode?Colors.white:Colors.black,
                      underLine: TextDecoration.none,

                  ),
                ),
              ),
              const SizedBox(height: 30,),
               CardItems(),

            ],
          ),
        )
    );
  }
}
