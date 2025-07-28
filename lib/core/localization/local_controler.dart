import 'package:e_commerce_app/core/services/my_service_lang.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocalControler extends GetxController {
  Locale? language;
  MyServiceLang myServiceLang = Get.find();

  changeLanguage(String lang) async {
   Locale locale = Locale(lang);
    myServiceLang.sharedPreferences.setString('lang', lang);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServiceLang.sharedPreferences.getString('lang');
    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');

    } else if (sharedPrefLang == 'en') {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}