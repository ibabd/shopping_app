import 'package:flutter/material.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  int radioPaymentIndex=1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        children: [
           buildRadioPayment(
             name: 'Paypal',
             image: 'assets/images/paypal.png',
             scale: 0.7,
             value: 1,
             onChange: (int ?value){
               setState(() {
                 radioPaymentIndex=value!;
               });
             }
           ),
          const SizedBox(height: 15,),
          buildRadioPayment(
              name: 'Google Pay',
              image: 'assets/images/google.png',
              scale: 0.8,
              value: 2,
              onChange: (int ?value){
                setState(() {
                  radioPaymentIndex=value!;
                });
              }
          ),
          const SizedBox(height: 15,),
          buildRadioPayment(
              name: 'Credit Card',
              image: 'assets/images/credit.png',
              scale: 0.7,
              value: 3,
              onChange: (int ?value){
                setState(() {
                  radioPaymentIndex=value!;
                });
              }
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
}) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image,scale: scale,),
              const SizedBox(width: 10,),
              TextUtils(
                  text: name,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                  underLine: TextDecoration.none,
              ),
            ],
          ),
          Radio(
              value: value,
              groupValue: radioPaymentIndex,
              onChanged: (int ?value){
               onChange(value);
              },
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
          ),
        ],
      ),
    );
  }
}
