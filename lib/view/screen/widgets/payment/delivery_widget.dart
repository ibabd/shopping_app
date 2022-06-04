import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/auth_controller.dart';
import 'package:shopping_app/logic/controller/payment_controller.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() => _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex=1;
  bool changeColor=false;
  final TextEditingController phoneController=TextEditingController();
  final controller=Get.find<PaymentController>();
  final authController=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          title: 'Asroo Shop',
          name: 'Ibrahim Mohamed',
          address: 'Egypt_Sharkia_Zagazig_bani_abad',
          phone:'01146852524',
          value: 1,
          color: changeColor?Colors.white:Colors.grey.shade400,
          onChange: (int ?value){
            setState(() {
              radioContainerIndex=value!;
              changeColor=! changeColor;
            });
          },
          icon: Container(),
        ),
        const SizedBox(height: 10,),
        Obx(()=>
            buildRadioContainer(
              title: 'Delivery',
              name: authController.displayName.value,
              address: controller.address.value,
              phone:  controller.phoneNumber.value,
              value: 2,
              color: changeColor?Colors.grey.shade400:Colors.white,
              onChange: (int ?value){
                setState(() {
                  radioContainerIndex=value!;
                  changeColor=! changeColor;
                  controller.updatePosition();
                });

              },
              icon: InkWell(
                onTap: (){
                  Get.defaultDialog(
                    title: 'Enter Your Phone Number',
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                    radius: 10,
                    cancelTextColor: Colors.black,
                    textCancel: 'Cancel',
                    confirmTextColor: Colors.black,
                    textConfirm: 'Save',
                    onCancel: (){
                      Get.toNamed(Routes.paymentScreen);
                    },
                    onConfirm: (){
                      Get.back();
                      controller.phoneNumber.value=phoneController.text;
                    },
                    buttonColor: Get.isDarkMode?pinkClr:mainColor,
                    content: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        controller: phoneController,
                        maxLength: 11,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        onChanged: (searchName) {

                        },
                        onSubmitted: (value){
                          phoneController.text=value;
                        },
                        decoration: InputDecoration(
                          fillColor:Get.isDarkMode?pinkClr.withOpacity(0.1): mainColor.withOpacity(0.2),
                          focusColor: Colors.red,
                          hintText: "Enter Your Phone Number",
                          helperStyle: const TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon:  Icon(Icons.phone,color:Get.isDarkMode?pinkClr: mainColor,),
                          suffixIcon: IconButton(
                            onPressed: (){
                              phoneController.clear();
                            },
                            icon: const Icon(Icons.close,color: Colors.black,),
                          ),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.contact_phone,
                  color: Get.isDarkMode?pinkClr:mainColor,
                ),
              ),
            ),
        ),
      ],
    );
  }

 Widget buildRadioContainer({
   required Color color,
   required int value,
   required Function onChange,
   required String title,
   required String name,
   required String phone,
   required String address,
   required Widget icon,
 }) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ]
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value:value ,
              groupValue:radioContainerIndex ,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              onChanged: (int ? value){
                onChange(value);
              },
            ),
            const SizedBox(width: 4,),
            Padding(padding: const EdgeInsets.only(top: 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: title,
                    underLine: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                ),
                const SizedBox(height: 5,),
                TextUtils(
                  text: name,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    const Text('🇪🇬+02 '),
                    TextUtils(
                      text: phone,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black,
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(width:120,),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                TextUtils(
                  text: address,
                  underLine: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: Colors.black,
                ),

              ],
            ),
            ),
          ],
        ),
      ),
    );
 }
}
