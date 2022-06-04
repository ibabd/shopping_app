
import 'package:flutter/material.dart';
import 'package:shopping_app/logic/controller/auth_controller.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/authTextFormField.dart';
import 'package:shopping_app/view/screen/widgets/auth_button.dart';
import 'package:shopping_app/view/screen/widgets/check_widget.dart';
import 'package:shopping_app/view/screen/widgets/containerUbder.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

     // معنه هات الكونترولر الى احنا عملناه هيتم استدعائه اول مايفتح البرنامج عكس الlazy
    //  final controller=Get.put(AuthController());
   // معنه هيتم استدعلئه لم انا اطلبها
  //final controller=Get.put(AuthController());

  final controller=Get.find<AuthController>();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                                  underLine: TextDecoration.none,
                                  text: 'SIGN',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28,
                                  color: Get.isDarkMode ? mainColor : pinkClr),
                              const SizedBox(
                                width: 3,
                              ),
                              TextUtils(
                                  underLine: TextDecoration.none,
                                  text: 'Up',
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
                            controller: nameController,
                            obscureText: false,
                            validator: (value) {
                              if (value == null) {
                                return 'Enter The Name ';
                              }
                              return '';
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset('assets/images/user.png')
                                : const Icon(
                                    Icons.person,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            sufferIcon: const Text(""),
                            hintText: 'User Name',
                          ),
                          const SizedBox(
                            height: 20,
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
                            builder:(context)=> AuthTextFormField(
                              controller: passwordController,
                              obscureText: controller.isVisibility?false:true,
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
                                icon:controller.isVisibility? const Icon(Icons.visibility_off,color: Colors.black,)
                                    :const Icon(Icons.visibility,color: Colors.black,),
                              ),
                              hintText: 'Password',
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                           CheckBoxWidget(),
                          const SizedBox(
                            height: 50,
                          ),
                          AuthButton(text: 'SIGN UP', onpress: () {

                              // if(controller.isCheckBox==false){
                              //   Get.snackbar(
                              //       'checkBox',
                              //       'Please, Accept term &conditions',
                              //     snackPosition: SnackPosition.BOTTOM,
                              //     backgroundColor: Colors.green,
                              //     colorText: Colors.white,
                              //   );
                              // }
                              //
                              // else if(formKey.currentState!.validate()){
                              //
                              //   // trim تعنى لو فيه مسافات على اليمين والشمال احذفها
                              //   String name=nameController.text.trim();
                              //   String email=emailController.text.trim();
                              //   String password=passwordController.text.trim();
                              //   controller.signUpUsingFirebase(
                              //       name: name,
                              //       email: email,
                              //       password: password,
                              //   );
                              //   controller.isCheckBox=true;

                            AuthController.instance.register(
                                email:emailController.text.trim(),
                                password:passwordController.text.trim(),
                                name:nameController.text.trim(),
                            );

                              }
                              // formKey.currentState!.save();
                              // if(formKey.currentState!.validate()){
                              // controller.signUpUsingFirebase();
                              //    Get.toNamed(Routes.mainScreen);
                              ),

                        ],
                      ),
                    ),
                  ),
                ),
                ContainerUnder(
                  text: 'Already have an account ?',
                  textType: 'Log in',
                  onPress: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
