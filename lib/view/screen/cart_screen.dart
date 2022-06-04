
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/cart_controller.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/cart/cart_product.dart';
import 'package:shopping_app/view/screen/widgets/cart/cart_total.dart';
import 'package:shopping_app/view/screen/widgets/cart/empty_cart.dart';
class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller=Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Cart Items'),
        elevation: 0,
        backgroundColor: Get.isDarkMode?darkGreyClr:mainColor,
        centerTitle: true,
        actions: [
        IconButton(
          onPressed: (){
            controller.clearAllProduct();
          },
          icon: const Icon(Icons.backspace),
        ),
        ],
      ),
      body: GetBuilder<CartController>(
        builder:(_){
          if(controller.productMap.isEmpty){
            return const CartEmpty();
          }else{
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                      itemBuilder: (context,index){
                        return  CartProductCard(
                          //دخلت على productMap بتاعتى  ثم جواها مفاتيح المفاتيح جواها ليست من المنتجات بتاعتنا دخلنا جو اليست وشغلنا index
                          product: controller.productMap.keys.toList()[index],
                          index: index,
                          //quantity this is value that founded in the key  key can take number of value or product
                          quantity: controller.productMap.values.toList()[index],
                        );
                      },
                      separatorBuilder: (context,index){
                        return const SizedBox(height: 20,);
                      },
                      itemCount: controller.productMap.length,
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(bottom: 30),
                    child: CartTotal(),
                  ),
                ],
              ),
            );
          }
        }
      ),
    );
  }
}

