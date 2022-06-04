// ignore_for_file: file_names

import 'package:flutter/material.dart';
class AuthTextFormField extends StatelessWidget {

  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget sufferIcon;
  final String hintText;

  const AuthTextFormField({Key? key,
     required this.controller,
     required this.obscureText,
     required this.validator,
     required this.prefixIcon,
     required this.sufferIcon,
     required this.hintText,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value){
       return validator(value);
      },
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon:prefixIcon,
        suffixIcon: sufferIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        //علشان اللون يظهر
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder:  OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
