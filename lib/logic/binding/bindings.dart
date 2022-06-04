

import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/auth_controller.dart';
import 'package:shopping_app/logic/controller/cart_controller.dart';
import 'package:shopping_app/logic/controller/category_controller.dart';
import 'package:shopping_app/logic/controller/main_controller.dart';
import 'package:shopping_app/logic/controller/payment_controller.dart';
import 'package:shopping_app/logic/controller/product_controller.dart';
import 'package:shopping_app/logic/controller/setting_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController);
    Get.lazyPut(() => SettingController());
    Get.put(PaymentController(),permanent: true);
    // علشان احفظ القيمه هخلى permanent true
  }

}