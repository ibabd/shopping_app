import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/routes/routes.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';

//import 'package:http/http.dart' as http;
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150,),
                  Container(
                    width: 190,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: TextUtils(
                        fontSize: 35,fontWeight: FontWeight.bold,text: 'Welcome',color:Colors.white,
                        underLine: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: 230,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TextUtils(
                            text: 'Asroo',
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: mainColor,
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(width: 7,),
                        TextUtils(
                          text: 'Shop',
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                 const SizedBox(height: 250,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal:40 ,vertical:12 ),
                    ),
                      onPressed: (){
                     // Get.to(const LoginScreen());
                      //  Get.toNamed(Routes.loginScreen);
                        //علشان يمنع سهم الرجوع او يحذفه
                        Get.offNamed(Routes.loginScreen);
                      },
                      child: const TextUtils(
                          text: 'Get Start',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                          underLine: TextDecoration.none,
                      ),
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                    const TextUtils(
                    text: 'Don\'t have an account ?',
                    fontWeight: FontWeight.normal,
                    fontSize:18,
                    color: Colors.white,
                      underLine: TextDecoration.none,
                  ),
                      TextButton(
                          onPressed: (){
                            Get.offNamed(Routes.signUpScreen);
                          },
                          child:  const TextUtils(
                            text: 'SignUp',
                            fontWeight: FontWeight.normal,
                            fontSize:18,
                            color: Colors.white,
                            underLine: TextDecoration.none,
                          ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
