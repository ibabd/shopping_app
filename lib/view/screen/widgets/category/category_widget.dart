import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/category_controller.dart';
import 'package:shopping_app/logic/controller/product_controller.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/category/category_item.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();
  final myController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CategoryController>(
      builder:(_){
        if(myController.isCategoryLoading.value){
          return  Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode?pinkClr:mainColor,
            ),
          );
        }else{
          return Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      myController.getCategoryIndex(index);
                      Get.to(()=>CategoryItems(
                        categoryTitle: myController.categoryNameList[index],
                      ));
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10),
                        image:  DecorationImage(
                          image: NetworkImage(
                            myController.imageCategory[index]
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child:  Padding(
                        padding:const EdgeInsets.only(left: 20, bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            myController.categoryNameList[index],
                            style:const TextStyle(
                              backgroundColor: Colors.black38,
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: myController.categoryNameList.length,
            ),
          );
        }
      }
    );

  }
}



