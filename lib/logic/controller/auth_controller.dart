import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopping_app/view/screen/main_screen.dart';
import 'package:shopping_app/view/screen/welcom_screen.dart';

class AuthController extends GetxController{

  bool isVisibility=false;
  bool isCheckBox=false;
  GoogleSignIn googleSignIn=GoogleSignIn(scopes: ['email']);
  var displayName=''.obs;
  var displayUserPhoto=''.obs;
  var displayUserEmail=''.obs;
  bool isSignIn=false;

  User? get userProfile=>auth.currentUser;

  final GetStorage boxStorage=GetStorage();
 // var displayUserName='';
  // String ? email;
  // String ? password;
  // String ? name;
  //FirebaseAuth auth=FirebaseAuth.instance;

  void visibility(){
    isVisibility=!isVisibility;


    update();
  }

  void checkBox(){
    isCheckBox=!isCheckBox;
    update();
  }


  // void signUpUsingFirebase({required String name,required String email,required String password})async{
  //
  //   try {
  //      await auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     ).then((value){
  //       displayUserName=name;
  //       auth.currentUser!.updateDisplayName(name);
  //      });
  //      update();
  //      Get.off(Routes.mainScreen);
  //   } on FirebaseAuthException catch (e) {
  //     //this variable firebase that told me about error this is write the error and i recieve that so that i make then empty
  //     String title=e.code;
  //     String message='';
  //     if (e.code == 'weak-password') {
  //       message='The password provided is too weak.';
  //     } else if (e.code == 'email-already-in-use') {
  //       message='The account already exists for that email.';
  //     }
  //     Get.snackbar(
  //       title,
  //       message,
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //     );
  //   } catch (error) {
  //     //هنا الفاير بيز ملوش دعوة بالموضوع علشان كد انا بقوله اطبع لية الايرور الى هيطلعلك وبصيت له قيمه الايرور تبع message
  //     Get.snackbar(
  //       'Error',
  //       error.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green,
  //       colorText: Colors.white,
  //     );
  //   }
    // try {
    //   await auth.createUserWithEmailAndPassword(
    //     email: email!,
    //     password: password!,
    //   );
    //   Get.offAll(MainScreen());
    // } catch (e) {
    //
    //   Get.snackbar(
    //     'Error to Register Account',
    //     e.toString(),
    //     colorText:Colors.black,
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    // }



// void signInWithEmailAndPassword()async{
//   try {
//
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email!,
//         password: password!,
//     );
//     Get.offAll(MainScreen());
//   }catch(e){
//     print(e.toString());
//     Get.snackbar(
//       'Error to Login Account',
//       e.toString(),
//       colorText:Colors.black,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
// }

  // void googleSignIn(){}
  // void faceBookSingInApp(){}
  // void resetPassword(){}
  // void signOutFromApp(){}
//
//
static AuthController instance=Get.find();
late Rx<User?>_user;
FirebaseAuth auth=FirebaseAuth.instance;
@override
  void onReady() {

    super.onReady();
    _user=Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user,_startScreen);
  }
  @override
  void onInit() {
    super.onInit();
    displayName.value=(userProfile !=null ?userProfile!.displayName:"")!;
    displayUserPhoto.value=(userProfile !=null ?userProfile!.photoURL:"")!;
    displayUserEmail.value=(userProfile !=null ?userProfile!.email:"")!;
  }

  _startScreen(User? user){
  if(user==null){
    Get.offAll(()=>const WelcomeScreen());
  }else{
    Get.offAll(()=> MainScreen());
  }
  }

  void register({required String name, required String email,required String password})async{
  try{
     await auth.createUserWithEmailAndPassword(email: email, password: password).then((value){
       displayName.value=name;
       auth.currentUser!.updateDisplayName(name);
     });
  }catch(e){
    Get.snackbar(

        'About User',
        'User Message',
      snackPosition: SnackPosition.BOTTOM,
      titleText: const Text('Account Creation Failed',style: TextStyle(color: Colors.white),),
      messageText: Text(e.toString(),style: const TextStyle(color: Colors.white),),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}

  void login(String email,String password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isSignIn=true;
      boxStorage.write("auth", isSignIn); 
      update();
    }catch(e){
      Get.snackbar(

        'About User',
        'User Message',
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text('Login Failed',style: TextStyle(color: Colors.white),),
        messageText: Text(e.toString(),style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.lightBlueAccent,
      );
    }
  }


  void logOut()async{
  try{
    await auth.signOut();
    displayName.value='';
    displayUserPhoto.value='';
    displayUserEmail.value='';
    isSignIn=false;
    boxStorage.remove("auth");
  }catch(e){
    Get.snackbar(

      'About User',
      'User Message',
      snackPosition: SnackPosition.BOTTOM,
      titleText: const Text('Login Failed',style: TextStyle(color: Colors.white),),
      messageText: Text(e.toString(),style: const TextStyle(color: Colors.white),),
      backgroundColor: Colors.lightBlueAccent,
    );
  }

  }

  void googleSignUp()async{
  // هخزن النتيجه بتاعه تسجيل الدخول فى متغير
 final GoogleSignInAccount? googleSignInAccount= await googleSignIn.signIn();
 displayName.value=googleSignInAccount!.displayName!;
 displayUserPhoto.value=googleSignInAccount.photoUrl!;
 displayUserEmail.value=googleSignInAccount.email;
  if(googleSignInAccount !=null){
    //1 هحصل على المصادقه
    GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
    //2 هنشئ credential
    final AuthCredential credential=GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await auth.signInWithCredential(credential);
  }





    // try{
    //
    //     final GoogleSignInAccount ? googleUser= await googleSignIn.signIn();
    //     displayName.value=googleUser!.displayName!;
    //     displayUserPhoto=googleUser.photoUrl!;
    //     //للحصول على معلومات google auth
    //     GoogleSignInAuthentication googleSignInAuthentication=await googleUser.authentication;
    //     //دة الى اقدر اجيب منها credential بتاعه الاكونت بتاع اليوزر الى عامل بيه sign in
    //     final AuthCredential credential= GoogleAuthProvider.credential(
    //       //بيحتاج منى حاجتين
    //       //
    //       idToken: googleSignInAuthentication.idToken,
    //       accessToken:googleSignInAuthentication.accessToken,
    //     );
    //     await auth.signInWithCredential(credential);
    //       Get.offAll( MainScreen());
    // }catch(error){
    //   Get.snackbar(
    //
    //     'About User',
    //     'User Message',
    //     snackPosition: SnackPosition.BOTTOM,
    //     titleText: const Text('Login Failed',style: TextStyle(color: Colors.white),),
    //     messageText: Text(error.toString(),style: const TextStyle(color: Colors.white),),
    //     backgroundColor: Colors.lightBlueAccent,
    //   );
    // }
  }

  void resetPassword(String email)async{
    try{
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    }catch(e){
      Get.snackbar(

        'About User',
        'User Message',
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text('Login Failed',style: TextStyle(color: Colors.white),),
        messageText: Text(e.toString(),style: const TextStyle(color: Colors.white),),
        backgroundColor: Colors.lightBlueAccent,
      );
    }
  }

}