import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/utils/constant.dart';

class ProductServices{

  static ProductServices instance=ProductServices();

  Future<List<dynamic>?>getProducts()async{
    try{
      final response=await http.get(Uri.parse('$baseUrl/products'));
      if(response.statusCode==200){
        if (kDebugMode) {
          print('success');
        }
        // لئن المعلومات الى فى body راجعه على هيئه  string
        //علشان كد استخدمت jsonDecode علشان يحول ليه من string to json
        final body=jsonDecode(response.body);
        return body;
      }

    }catch(e){
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

}