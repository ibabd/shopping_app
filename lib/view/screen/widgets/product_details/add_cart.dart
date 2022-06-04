import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/cart_controller.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class AddCart extends StatelessWidget {
  final double price;
  final Product product;
   AddCart({Key? key,required this.product,required this.price}) : super(key: key);
 final controller=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const TextUtils(
                  text: "price",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                  underLine: TextDecoration.none,
              ),
              Text(
                " \$$price",
                style: TextStyle(
                  color:Get.isDarkMode?Colors.white:Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
         const SizedBox(width: 20,),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary:Get.isDarkMode?pinkClr: mainColor,
                ),
                  onPressed: (){
                  controller.addProductToCart(product);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
                      Text(
                        'Add to cart',
                        style: TextStyle(
                        color:Colors.white,
                        fontSize: 20,
                      ),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.shopping_cart_outlined,),
                    ],
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
