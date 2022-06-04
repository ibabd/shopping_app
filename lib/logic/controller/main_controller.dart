


import 'package:get/get.dart';
import 'package:shopping_app/view/screen/category_screen.dart';
import 'package:shopping_app/view/screen/favorite_screen.dart';
import 'package:shopping_app/view/screen/home_screen.dart';
import 'package:shopping_app/view/screen/setting_screen.dart';

class MainController extends GetxController{

  static MainController instance=Get.find();


  RxInt currentIndex=0.obs;
  final tabs=[
     HomeScreen(),
     const CategoryScreen(),
     FavoriteScreen(),
     const SettingScreen(),
  ].obs;

  final titles=[
    "Asroo Shop",
    "Categories",
    "Favourites",
    "Settings"
  ].obs;
}