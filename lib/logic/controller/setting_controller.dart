
import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping_app/utils/constant.dart';

class SettingController extends GetxController{

var storage=GetStorage();
var langLocal=ene;
var switchValue=false.obs;
//عاوز الحروف الاوله من اى اسم  capital

String capitalize(String profileName){
  return profileName.split(" ").map((name) => name.capitalize).join(" ");
}

@override
  void onInit()async {
    super.onInit();
   langLocal=await getLanguage;
  }

//Language

//هخزن فيها الداتا وهستخدم getStorage

void saveLanguage(String lang)async{
await storage.write('lang', lang);
}

//هجيب منها الداتا الى اتخزنت
FutureOr<String>get  getLanguage async{
return await storage.read('lang');
}

//لتغيير اللغه
void changeLanguage(String typeLang){
  saveLanguage(typeLang);
  if(langLocal==typeLang){
    //هنا بقوله لو قيمه langLocal مثلا عربي ==typelang هو كمان بيساوى العربي مش ترجع ليه اى حاجه
    return;
  }

  if(typeLang==frf){
    //لو القيمه فرنساوى  هروح اخزن القيمه فى المتغير الى اسمه langLocal واحفظه تبع getStorage
    langLocal=frf;
    saveLanguage(frf);
  }else if(typeLang==ara){
    langLocal=ara;
    saveLanguage(ara);
  }else{
    langLocal=ene;
    saveLanguage(ene);
  }
  update();



}



}