
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/cart_controller.dart';
import 'package:shopping_app/logic/controller/category_controller.dart';
import 'package:shopping_app/logic/controller/product_controller.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/product_details_screen.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({Key? key,required this.categoryTitle}) : super(key: key);
  final controller = Get.put(ProductController());
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title:  Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode?darkGreyClr:mainColor,
      ),
      body:  GetBuilder<CategoryController>(
        builder: (_){
          if(categoryController.isCategory.value){
            return Center(
              child: CircularProgressIndicator(
                color: Get.isDarkMode?pinkClr:mainColor,
              ),
            );
          }else{
            return GridView.builder(
              itemCount: categoryController.categoryList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return buildCardItems(
                  image: categoryController.categoryList[index].image!,
                  price: categoryController.categoryList[index].price!,
                  rate: categoryController.categoryList[index].rating!.rate!,
                  productId: categoryController.categoryList[index].id!,
                  product: categoryController.categoryList[index],
                  onTap: () {
                    Get.to(() => ProductDetailsScreen(
                      product: categoryController.categoryList[index],
                    ));
                  },
                );

              },
            );
          }
        }
      )
    );
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required Product product,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                ),
              ]),
          child: Column(
            children: [
              GetBuilder<ProductController>(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavorite(productId);
                      },
                      icon: controller.isFavourites(productId)
                          ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                          : const Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(product);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ $price',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: '$rate',
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.white,
                              underLine: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 13,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
