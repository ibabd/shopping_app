import 'package:get/get.dart';
import 'package:shopping_app/model/product_model.dart';
import 'package:shopping_app/services/category_services.dart';

class CategoryController extends GetxController {
  var   categoryNameList =[].obs;

  var isCategoryLoading = false.obs;
  var isCategory = false.obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg"
  ].obs;


  var categoryList=<Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategories();
  }

  void getCategories() async {
    var categoryName = await CategoryServices.instance.getCategory();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
    update();
  }

//هروح استدعى هذة الفانكشن عند الضغط على الصورة بتاعه المنتج الى هى موجودة فى صفحه categoryScreen بالاخض فى categoryWidget
  getAllCategories(String nameCategory) async {
    //المتغير دة nameCategory هيتحط فية اليستالى فيها اسماء الcategory المعرفه categoryNameList
   isCategory(true);
   categoryList.value =await AllCategoryServices.getAllCategory(nameCategory);
   isCategory(false);
   update();
 }
//عملت فانكشن برقم ال index علشان مثلا لم اضغط على المنتج الكترونى يروح يجيب المنتجات ثم ينتقل الى صفحه  category Item وليس العكس بدل ماينتقل ويروح يجيب المنتجات بعدين
  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategories(categoryNameList[index]);
    if (categoryAllName !=null) {
      categoryList.value=categoryAllName;
    }
    update();
  }
}
