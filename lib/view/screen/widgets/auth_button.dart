import 'package:flutter/material.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
import 'package:get/get.dart';
class AuthButton extends StatelessWidget {
  final String text;
  final Function() onpress;
  const AuthButton({Key? key,required this.text,required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style:ElevatedButton.styleFrom(
          primary: Get.isDarkMode?mainColor:pinkClr,
          maximumSize: const Size(360,50)
        ) ,
        onPressed: onpress,
        child:   TextUtils(
          text: text,
          underLine: TextDecoration.none,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,

        ),
    );
  }
}
