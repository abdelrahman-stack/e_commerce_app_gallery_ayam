import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServiceLang extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServiceLang> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialService() async {
  await Get.putAsync(() => MyServiceLang().init());
}
