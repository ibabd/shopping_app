

import 'package:get/get.dart';

import 'package:shopping_app/logic/binding/bindings.dart';

import 'package:shopping_app/view/screen/auth/forget_password.dart';
import 'package:shopping_app/view/screen/auth/signIn_screen.dart';
import 'package:shopping_app/view/screen/auth/sign_up_screen.dart';
import 'package:shopping_app/view/screen/cart_screen.dart';
import 'package:shopping_app/view/screen/category_screen.dart';
import 'package:shopping_app/view/screen/favorite_screen.dart';
import 'package:shopping_app/view/screen/home_screen.dart';
import 'package:shopping_app/view/screen/main_screen.dart';
import 'package:shopping_app/view/screen/payment_screen.dart';
import 'package:shopping_app/view/screen/setting_screen.dart';
import 'package:shopping_app/view/screen/welcom_screen.dart';

class AppRoute{
  //initialRoute


 //1 static const welcome='/welcomeScreen';

  //2
  static const welcome=Routes.welcomeScreen;
  static const main=Routes.mainScreen;

  // getPages    static is mean can i reach from any where
static final routes=[
  GetPage(name: Routes.welcomeScreen, page: ()=>const WelcomeScreen()),
  GetPage(name: Routes.loginScreen, page: ()=> LoginScreen(),binding: Binding()),
  GetPage(name: Routes.signUpScreen, page: ()=>SignUpScreen(),binding: Binding()),
  GetPage(name: Routes.forgotPasswordScreen, page: ()=> ForgotPasswordScreen(),binding: Binding()),
  GetPage(name: Routes.mainScreen, page: ()=>   MainScreen(),binding:Binding()),
  GetPage(name: Routes.homeScreen, page: ()=>   HomeScreen(),binding:Binding()),
  GetPage(name: Routes.categoryScreen, page: ()=>   const CategoryScreen(),binding: Binding()),
  GetPage(name: Routes.favoriteScreen, page: ()=>   FavoriteScreen(),binding: Binding()),
  GetPage(name: Routes.settingScreen, page: ()=>   const SettingScreen(),binding: Binding()),
  GetPage(name: Routes.cartScreen, page: ()=>   CartScreen(),binding: Binding()),
  GetPage(name: Routes.paymentScreen, page: ()=>   const PaymentScreen(),binding: Binding()),
];
}

class Routes{
  static const welcomeScreen='/welcomeScreen';
  static const loginScreen='/loginScreen';
  static const signUpScreen='/signUpScreen';
  static const forgotPasswordScreen='/forgotPasswordScreen';
  static const mainScreen='/mainScreen';
  static const homeScreen='/homeScreen';
  static const categoryScreen='/categoryScreen';
  static const settingScreen='/settingScreen';
  static const favoriteScreen='/favoriteScreen';
  static const cartScreen='/cartScreen';
  static const paymentScreen='/paymentScreen';
}