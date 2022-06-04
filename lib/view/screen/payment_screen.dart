import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/payment/delivery_widget.dart';
import 'package:shopping_app/view/screen/widgets/payment/payment_method.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        elevation: 0,
        backgroundColor: Get.isDarkMode?darkGreyClr:mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(15),
          child: Column(
            children: [
              TextUtils(
                  text: 'Shipping to',
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                  fontSize: 24,
                  color: Get.isDarkMode?Colors.white:Colors.black,
              ),
              const SizedBox(height: 20,),
              const DeliveryContainerWidget(),
              const SizedBox(height: 20,),
              TextUtils(
                text: 'Payment Method',
                underLine: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Get.isDarkMode?Colors.white:Colors.black,
              ),
              const SizedBox(height: 20,),
              const PaymentMethod(),
              const SizedBox(height: 30,),
              Center(
                child: TextUtils(
                    underLine: TextDecoration.none,
                    text: "Total: 200\$",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Get.isDarkMode?Colors.white:Colors.black
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0.0,
                      primary:Get.isDarkMode?pinkClr: mainColor,
                    ),
                    onPressed: (){},
                    child: const Text('Pay Now',style: TextStyle(fontSize: 22,color: Colors.white),),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
