// ignore_for_file: invalid_use_of_protected_member

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/cart_controller.dart';
import 'package:shopping_app/logic/controller/main_controller.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:shopping_app/utils/theme.dart';
class MainScreen extends StatelessWidget {
    MainScreen({Key? key}) : super(key: key);
   final controller=Get.find<MainController>();
    final cartController=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child:Obx((){
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            leading: Container(),
            actions: [
           GetBuilder<CartController>(
             builder:(_)=> Badge(
              position: BadgePosition.topEnd(top: 0, end: 3),
              animationDuration: const Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent:  Text(
               cartController.quantity().toString(),
               style:const TextStyle(color: Colors.white),
          ),
              child:   IconButton(
                onPressed: (){
                  Get.toNamed(Routes.cartScreen);
                },
                icon: Image.asset('assets/images/shop.png'),
              ),
        ),
           ),


            ],
            title: Text(controller.titles[controller.currentIndex.value]),
            centerTitle: true,
            backgroundColor:Get.isDarkMode? darkGreyClr:mainColor,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
            currentIndex: MainController.instance.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items:  [
              BottomNavigationBarItem(
                activeIcon: Icon(
                    Icons.home,
                    color:Get.isDarkMode?pinkClr:mainColor
                ),
                icon: Icon(
                    Icons.home,
                    color:Get.isDarkMode? Colors.white:Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                    Icons.category,
                    color:Get.isDarkMode?pinkClr:mainColor
                ),
                icon: Icon(
                    Icons.category,
                    color:Get.isDarkMode? Colors.white:Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                    Icons.favorite,
                    color:Get.isDarkMode?pinkClr:mainColor
                ),
                icon: Icon(
                    Icons.favorite,
                    color:Get.isDarkMode? Colors.white:Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                    Icons.settings,
                    color:Get.isDarkMode?pinkClr:mainColor
                ),
                icon: Icon(
                    Icons.settings,
                    color:Get.isDarkMode? Colors.white:Colors.black),
                label: '',
              ),
            ],
            onTap: (index){
              MainController.instance.currentIndex.value=index;
            },
          ),
          body: IndexedStack(
            index:controller.currentIndex.value ,
            children:
              controller.tabs.value,

          ),
        );
    })
    );
  }
}
//        body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children:  [
//             const Center(
//               child: Text('Main Screen'),
//             ),
//             const SizedBox(height: 30,),
//             TextButton(onPressed: (){
//                      AuthController.instance.logOut();
//               },
//                 child: const Text('LogOut'))
//           ],
//         ),
