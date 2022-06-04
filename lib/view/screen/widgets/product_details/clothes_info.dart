import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shopping_app/logic/controller/product_controller.dart';
import 'package:shopping_app/utils/theme.dart';
import 'package:shopping_app/view/screen/widgets/text_utils.dart';
import 'package:readmore/readmore.dart';


class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String descriptin;
  ClothesInfo(
      {Key? key,
      required this.title,
      required this.productId,
      required this.rate,
        required this.descriptin
      })
      : super(key: key);

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                title,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              )),
              GetBuilder<ProductController>(
                builder: (_) => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavorite(productId);
                    },
                    child: controller.isFavourites(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: "$rate",
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underLine: TextDecoration.none,
              ),
              const SizedBox(width: 8,),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) =>const Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                ),
                itemCount: 5,
                itemSize: 50.0,
                direction: Axis.horizontal,

              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
              descriptin,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign:TextAlign.justify ,
            trimCollapsedText: "Show More",
            trimExpandedText: "Show Less",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?pinkClr:mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?pinkClr:mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode?pinkClr:mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
