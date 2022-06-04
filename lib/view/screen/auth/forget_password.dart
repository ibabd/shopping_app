import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/auth_controller.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/authTextFormField.dart';
import 'package:shopping_app/view/screen/widgets/auth_button.dart';
class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({Key? key}) : super(key: key);
   final formKey=GlobalKey<FormState>();
   final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       appBar: AppBar(
         backgroundColor: Get.isDarkMode?Colors.white:darkGreyClr,
         title: Text('Forgot Password',
         style: TextStyle(
           color: Get.isDarkMode?mainColor:pinkClr,
         ),
         ),
        centerTitle: true,
         leading: IconButton(
           onPressed: (){
             Get.back();
           },
           icon: Icon(Icons.arrow_back,
             color:Get.isDarkMode? Colors.black:Colors.white,),
         ),
       ),
        backgroundColor: Get.isDarkMode?Colors.white:darkGreyClr,
        body: Form(
          key:formKey ,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: (){
                        Get.back();
                      },
                      icon: const Icon(Icons.close_rounded,color: Colors.white,),
                    ),
                  ),
                 const SizedBox(height: 20,),
                   Text('if you want to recover your account,then please provide your email ID below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Get.isDarkMode?Colors.black:Colors.white
                  ),
                  ),
                  const SizedBox(height: 50,),
                  Image.asset('assets/images/forgetpass copy.png',width: 250,),
                  const SizedBox(height: 50,),
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
                  const SizedBox(height: 50,),
                  AuthButton(text: 'Send', onpress: (){
                    AuthController.instance.resetPassword(emailController.text.trim());
                  }),


                ],
              ),
            ),
          ),
        ),
    ),
    );
  }
}
