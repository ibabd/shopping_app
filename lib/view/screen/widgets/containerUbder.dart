// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPress;
  const ContainerUnder({Key? key,required this.text, required this.onPress,required this.textType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration:  BoxDecoration(
        color: Get.isDarkMode?mainColor:pinkClr,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            underLine: TextDecoration.none,
          ),
          TextButton(
              onPressed: onPress,
              child: TextUtils(
                underLine: TextDecoration.none,
                text: textType,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
          ),
        ],
      ),
    );
  }
}
