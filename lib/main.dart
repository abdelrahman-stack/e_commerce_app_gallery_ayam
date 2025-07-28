import 'package:e_commerce_app/core/functions/on_generate_routes.dart';
import 'package:e_commerce_app/core/localization/local_controler.dart';
import 'package:e_commerce_app/core/localization/my_translation.dart';
import 'package:e_commerce_app/core/services/custom_bloc_observer.dart';
import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/core/services/my_service_lang.dart';
import 'package:e_commerce_app/core/services/shared_preferance_singleton.dart';
import 'package:e_commerce_app/core/utils/theme_controller.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
    Bloc.observer = CustomBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  await Prefs.init();
  setupGetit();
  await initialService();
  Get.put(ThemeController());
   Get.put(LocalControler());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalControler localControler = Get.put(LocalControler());
    return GetMaterialApp(
       theme: ThemeData(
  fontFamily: 'Cairo',
  brightness: Brightness.light,
),
        darkTheme: ThemeData(
  fontFamily: 'Cairo',
  brightness: Brightness.dark,
),
      themeMode: Get.find<ThemeController>().theme,
      locale: localControler.language,
      translations: MyTranslation(),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
