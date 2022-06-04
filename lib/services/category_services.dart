import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/model/category_model.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/utils/constant.dart';

class CategoryServices{

  static CategoryServices instance=CategoryServices();

  Future<List<String>>getCategory()async{

      final response=await http.get(Uri.parse('$baseUrl/products/categories'));
      if(response.statusCode==200){
        // لئن المعلومات الى فى body راجعه على هيئه  string
        //علشان كد استخدمت jsonDecode علشان يحول ليه من string to json
        var jsonData=response.body;
        return categoryModelsFromJson(jsonData);
      }else{
        return throw Exception("Failed to load Category");
      }
    }
    //كد انا جبت الapi الاول بتاع ليست بااسماء  category هبدأ استدعيها
}

class AllCategoryServices{
 static Future<List<Product>>getAllCategory(String categoryNames)async{
      final response=await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));
      if(response.statusCode==200){
        // لئن المعلومات الى فى body راجعه على هيئه  string
        //علشان كد استخدمت jsonDecode علشان يحول ليه من string to json
        final body=jsonDecode(response.body);
        List<Product> categories=[];
        for(var u in body){
          Product product=Product.fromJson(u);
          categories.add(product);
        }
        return categories;
        //return productModelsFromJson(body);
      }else{
        return throw Exception("Failed to load Category");
      }



  }

}