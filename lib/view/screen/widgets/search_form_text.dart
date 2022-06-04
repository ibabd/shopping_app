import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/product_controller.dart';

class SearchFormText extends StatelessWidget {
   SearchFormText({Key? key}) : super(key: key);
  final controller=Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GetBuilder<ProductController>(
        builder:(_)=> TextField(
          controller: controller.searchController,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          onChanged: (searchName) {
            controller.addSearchToList(searchName);
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.red,
            hintText: "Search with Name & price",
            helperStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: const Icon(Icons.search),
            suffixIcon:controller.searchController.text.isNotEmpty
            ?IconButton(
              onPressed: () {
                controller.clearSearch();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            )
                :null,
            //تفعيل الخلفيه
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
