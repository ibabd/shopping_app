// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/view/screen/widgets/product_details/add_cart.dart';
import 'package:shopping_app/view/screen/widgets/product_details/clothes_info.dart';
import 'package:shopping_app/view/screen/widgets/product_details/image_slider.dart';
import 'package:shopping_app/view/screen/widgets/size_list.dart';
class ProductDetailsScreen extends StatelessWidget {
  final Product product;
   ProductDetailsScreen({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              ImageSlider(
                imageUrl:product.image! ,
              ),
               ClothesInfo(
                title: product.title!,
                 productId: product.id!,
                 rate: product.rating!.rate!,
                 descriptin: product.description!,
              ),
               const SizeList(),
               AddCart(
                 product: product,
                 price: product.price!,

               ),
            ],
          ),
        ),
      ),
    );
  }
}
