import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/screen/widgets/category/category_widget.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
          padding:const EdgeInsets.only(left: 15,top: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child:Padding(
                  padding:const EdgeInsets.only(left: 15,top: 15),
                child: TextUtils(
                    text: 'Category',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    underLine: TextDecoration.none,
                    color: Get.isDarkMode?Colors.white:Colors.black
                ),
              ) ,
            ),
            const SizedBox(height: 10,),
             CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
