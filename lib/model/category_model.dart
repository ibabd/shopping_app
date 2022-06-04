
// To parse this JSON data, do
//
//     final productModels = productModelsFromJson(jsonString);
import 'dart:convert';
//هعمل ليست بتاخد الجيسون وتحوله الى نص
List<String> categoryModelsFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));
// دى بتاخد النص وتحوله الى جيسون
String categoryModelsToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));





