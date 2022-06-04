

import 'package:get/route_manager.dart';
import 'package:shopping_app/language/ar.dart';
import 'package:shopping_app/language/en.dart';
import 'package:shopping_app/language/fr.dart';
import 'package:shopping_app/utils/constant.dart';

class LocalizationApp extends Translations{
  //هروح فى  main.dart واظبط شويه حاجات تبع اللغه
  @override
  Map<String, Map<String, String>> get keys => {
    ene:en,
    ara:ar,
    frf:fr,
  };

}