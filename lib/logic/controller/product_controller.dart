



// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/services/product_services.dart';

class ProductController extends GetxController{

 // List<String>categories=["All","men's clothing","jewelery","electronics","women's clothing"];
  bool isLoading=false;
  List<Product>productList=[];
  List<Product>favoriteList=[];
  var storage=GetStorage();
 bool isFavorites=false;
 var searchList=<Product>[];

 TextEditingController searchController=TextEditingController();


  @override
  void onInit(){
   super.onInit();
   List? storedShopping=storage.read<List>('isFavouritesList');
   if(storedShopping !=null){
     favoriteList=storedShopping.map((e) => Product.fromJson(e)).toList().obs;
   }
   getAllProduct();
   //علشان اقراء البيانات بتاعه الداتا بيز

  }



  Future<void>getAllProduct()async{
    List ? myList=await ProductServices.instance.getProducts();
    productList=myList!.map((element) =>Product.fromJson(element)).toList();
    isLoading=true;
    update();
  }

  //logic for favorite screen
  // void addFavorite(){
  //   isFavorites =!isFavorites;
  //
  // }

   void manageFavorite(int productId)async{
    //  محتاج اعمل اضافه جو اليست الى اسمها  favoritesList
     //للمنتجات الى جايه من protectListوفقا لل id
     //عاوز اطلع من productList  id بتاعه
    // productList.firstWhere((element) => element.id==productId);
     //انا دخلت جو الليست دى وعملت بحث عن id الى جو اليست هل بيساوى idالى انا اعطيته لك ولا لا
     //هحطها داخل favoriteList.add
     //كد عملت اضافه للعنصر داخل الليست وفقا لل id المتوافق مع id الى انا مديه له ولا لا
   //favoriteList.add(productList.firstWhere((element) => element.id==productId));
   //علشان احفظ الحاجات الى ضفتها
   // await storage.write('isFavouritesList', favoriteList);
     //1 هروح اجيب indexفى اليست 
     var existingIndex=favoriteList.indexWhere((element) => element.id==productId);
     if(existingIndex>=0){
        favoriteList.removeAt(existingIndex);
        //favoriteList.refresh();

        await storage.remove('isFavouritesList');
     }else{
       favoriteList.add(productList.firstWhere((element) => element.id==productId));
       //save to database when you logout to pp
       await storage.write('isFavouritesList', favoriteList);
     }
     update();

   }

// function to change icon وفقا id
   bool isFavourites(int productId){
    //علشان يعلم على عنصر واحد فقط عندم اضغط على الايكونه بتاعته

    return   favoriteList.any((element) => element.id==productId);
   }

   //بتعمل اضافه للمنتجات الى بحثنا عنها جو ليست جديدة
  //انا محتاج اعمل بحث فى اليست الى اسمها productListبعد مايتعمل البحث هضفها داخل اليست الجديدة الى هى سيرش ليست
   void addSearchToList(String searchName){
    searchName=searchName.toLowerCase();
    //بقوله اعملى بحث جو الproductList
    searchList=productList.where((search) {
      var searchTitle=search.title!.toLowerCase();
      var searchPrice=search.price.toString().toLowerCase();
     return searchTitle .contains(searchName) || searchPrice.contains(searchName);
    }).toList();
    update();
   }

 //نضف او امسح لية البحث
   void clearSearch(){
    searchController.clear();
    addSearchToList("");
   }






}