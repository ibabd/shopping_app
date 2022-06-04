import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:shopping_app/utils/theme.dart';
class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,
            size:150,
            color: Get.isDarkMode?Colors.white:Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "You Cart Is",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode?Colors.white:Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "Empty",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode?pinkClr:mainColor,
                    ),
                  ),
                ]
              )
          ),
          const SizedBox(height: 10,),
           Text('add items to get Started', style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode?pinkClr:mainColor,
          ),),
          const SizedBox(height: 50,),
          ElevatedButton(
              onPressed: (){
                Get.toNamed(Routes.mainScreen);
              },
              child: const Text('Go to Home',style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
              primary: Get.isDarkMode?pinkClr:mainColor,
            ),
          ),

        ],
      ),
    );
  }
}
