


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController{

  final GetStorage boxStorage=GetStorage();
  final key='isDarkModes';
  saveThemeDataInBox(bool isDark){
  boxStorage.write(key, isDark);
  }
  getThemeDataFromBox(){
    return boxStorage.read<bool>(key)??false;
  }
  //اول مالقيمه ترجع ارجعه له هنا تحت
  ThemeMode get themeDataGet{
 return getThemeDataFromBox()?ThemeMode.dark:ThemeMode.light;
  }





  void changesTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getThemeDataFromBox());
  }
}