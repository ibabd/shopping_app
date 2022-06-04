// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/auth_controller.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/authTextFormField.dart';
import 'package:shopping_app/view/screen/widgets/auth_button.dart';
import 'package:shopping_app/view/screen/widgets/check_widget.dart';
import 'package:shopping_app/view/screen/widgets/containerUbder.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 40),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextUtils(
                                  text: 'LOG',
                                  underLine: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28,
                                  color: Get.isDarkMode ? mainColor : pinkClr),
                              const SizedBox(
                                width: 3,
                              ),
                              TextUtils(
                                  text: 'IN',
                                  underLine: TextDecoration.none,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          AuthTextFormField(
                            controller: emailController,
                            obscureText: false,
                            validator: (value) {
                              if (value == null) {
                                return 'Enter The email ';
                              }
                              return '';
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/email.png')
                                : const Icon(Icons.email, color: pinkClr),
                            sufferIcon: const Text(""),
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GetBuilder<AuthController>(
                            init: AuthController(),
                            builder: (context) => AuthTextFormField(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibility ? false : true,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer than 6 character  ';
                                }
                                return '';
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Image.asset('assets/images/lock.png')
                                  : const Icon(Icons.lock, color: pinkClr),
                              sufferIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              hintText: 'Password',
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgotPasswordScreen);
                              },
                              child:  TextUtils(
                                underLine: TextDecoration.none,
                                fontSize: 14,
                                color:Get.isDarkMode?Colors.white: Colors.black,
                                fontWeight: FontWeight.normal,
                                text: 'Forgot Password',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CheckBoxWidget(),
                          const SizedBox(
                            height: 50,
                          ),
                          AuthButton(
                                  text: 'LOG IN', onpress: () {
                                     AuthController.instance.login(
                                         emailController.text.trim(),
                                         passwordController.text.trim(),
                                     );
                                    }
                              ),
                          const SizedBox(height: 20,),
                          TextUtils(
                              text: 'OR',
                              underLine: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                              fontSize: 28,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black),
                          const SizedBox(height: 20,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              InkWell(
                                  onTap:(){},
                                  child: Image.asset('assets/images/facebook.png',height: 30,width: 30,)),
                              const SizedBox(width: 20,),
                              InkWell(
                                  onTap:(){
                                    googleLogIn();
                                  },
                                  child: Image.asset('assets/images/google.png')),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                ContainerUnder(
                  text: 'Don\'t have an account ?',
                  textType: 'Sign Up',
                  onPress: () {
                    Get.offNamed(Routes.signUpScreen);
                  },
                ),
              ],
            ),
          )),
    );
  }
  void googleLogIn(){
    AuthController.instance.googleSignUp();
  }
}
