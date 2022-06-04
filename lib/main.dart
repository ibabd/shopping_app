import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping_app/language/localization.dart';
import 'package:shopping_app/logic/controller/auth_controller.dart';
import 'package:shopping_app/logic/controller/cart_controller.dart';
import 'package:shopping_app/logic/controller/category_controller.dart';
import 'package:shopping_app/logic/controller/main_controller.dart';
import 'package:shopping_app/logic/controller/payment_controller.dart';
import 'package:shopping_app/logic/controller/product_controller.dart';
import 'package:shopping_app/logic/controller/setting_controller.dart';
import 'package:shopping_app/logic/controller/theme_controller.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/constant.dart';
import 'package:shopping_app/utils/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //معنها استدعى ليه كل خدمات الفاير بيز
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put(AuthController());
  Get.put(MainController());
  Get.put(ProductController());
  Get.put(CartController());
  Get.put(CategoryController());
  Get.put(SettingController());
  Get.put(PaymentController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Store Shop',
      debugShowCheckedModeBanner: false,
      //اللغه الرسميه
      locale: Locale(GetStorage().read<String>('lang').toString()),
      //لو حصل اى مشكله فى اللغه او متعرفش على ملفات اللغه
      fallbackLocale:Locale(ene),
      translations: LocalizationApp(),
      theme:ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser !=null||GetStorage().read<bool>("auth")==true?AppRoute.main:AppRoute.welcome,
      getPages: AppRoute.routes,
    );
  }
}
