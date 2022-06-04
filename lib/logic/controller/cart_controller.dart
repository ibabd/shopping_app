import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:shopping_app/utils/theme.dart';

class CartController extends GetxController {
  get productSubTotal=>productMap.entries.map((e) => e.key.price * e.value).toList();
  get total=> productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
  var productMap = {};
  void addProductToCart(Product product) {
    if (productMap.containsKey(product)) {
      //معناها لو المفتاح موجود ضيف ليه product داخل productMap مرة واحده فقط
      //معناها لو المفتاح موجود ضيف لية الproduct داخل  productMap ولو اتكرر معايه المفتاح اعمل له اضافه تانى
      productMap[product] += 1;
      // وعاوز اجيب السعر هقوله خش جو  الماب ولف بداخلها وطلع السعر منها
      //enters معناها عاوز اجيب المدخلات  الى جو الماب
      //لف جو الماب وطلع لية السعر واضربه فى عدد القيم ثم حوله الى ليست
      //من المتغير e روحت جبت المفتاح ثم من خلال لمفتاح جبت السعر ثم ضربته فى عدد القيم ثم حولته الى ليست
      //كد عرفت اجيب مجموع المنتج الواحد
      //productMap.entries.map((e) => e.key.price * e.value).toList();
      //لو عاوز اجيب totalهقوله نفس الى فوق .reduce معناها اجمع ليه كل الى فى الماب من منتجات
      // productMap.entries
      //     .map((e) => e.key.price * e.value)
      //     .toList()
      //     .reduce((value, element) => value + element)
      //     .toStringAsFixed(2);
    } else {
      //لو المفتاح مش موجود ضيف لية مرة واحدة فقط
      productMap[product] = 1;
      productMap.entries
          .map((e) => e.key.price * e.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
      //علشان الرقم doubleلو كبير فبحوله الى string واخد اول رقمين
    }
    update();
  }

  void removeProductToCart(Product product) {
    //لو المفتاح موجود ووصل 0 احذفه من السله المشتريات
    if (productMap.containsKey(product)&&productMap[product]==0 ) {
     productMap.removeWhere((key, value) => key==product);
    }else{
      //لو مش وصل للواحد احذف لية رقم واحد بس
      productMap[product] -=1;
    }
    update();
  }
  void removeOneProduct(Product product) {
      productMap.removeWhere((key, value) => key==product);
      update();
  }
  void clearAllProduct() {
    Get.defaultDialog(
      title: "Clear Products",
      titleStyle:const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need to Clear All',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " Yes",
      confirmTextColor: Colors.white,
      onCancel: (){
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: (){
        productMap.clear();
        Get.back();
      },
      buttonColor:Get.isDarkMode? pinkClr:mainColor,
    );
    update();
  }
  int quantity(){
    if(productMap.isEmpty){
      return 0;
    }else {
      return productMap.entries.map((e) => e.value).toList().reduce((value,
          element) => value + element);
    }

  }
}
