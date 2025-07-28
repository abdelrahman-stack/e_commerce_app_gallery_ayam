import 'package:e_commerce_app/core/constant/constants.dart';
import 'package:e_commerce_app/core/localization/local_controler.dart';
import 'package:e_commerce_app/core/services/shared_preferance_singleton.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button_language.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageView extends GetView<LocalControler> {
  const LanguageView({super.key});
  static const String routeName = 'language';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1'.tr, style: AppStyles.bold23),
            const SizedBox(height: 16),
            CustomButtonLanguage(
              text: 'English',
              onPressed: () {
                Prefs.setBool(kIsOnBoaringViewSeen, true);
                Get.put(LocalControler()).changeLanguage('en');
                Navigator.pushNamed(context, OnBoardingView.routeName);
              },
            ),
            const SizedBox(height: 16),
            CustomButtonLanguage(
              text: 'Arabic',
              onPressed: () {
                Prefs.setBool(kIsOnBoaringViewSeen, true);

                Get.put(LocalControler()).changeLanguage('ar');
                Navigator.pushNamed(context, OnBoardingView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
