import 'package:e_commerce_app/core/constant/constants.dart';
import 'package:e_commerce_app/core/functions/get_user.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/theme_controller.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/auth/presentation/views/signin_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/about_us_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_button_info.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoViewBody extends StatelessWidget {
  const UserInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kTopPadding),
          buildCustomAppBar(
            context,
            title: '30'.tr,
            showLeading: false,
            showNotification: false,
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: Image.asset(Assets.assetsImagesProfileImage),
            title: Text(getUser()!.name, style: AppStyles.bold13),
            subtitle: Text(
              getUser()!.email,
              style: AppStyles.regular13.copyWith(
                color: const Color(0xff888FA0),
              ),
            ),
          ),
          const SizedBox(height: 16),

          const Divider(thickness: .7, color: Color(0xffDDDFDF)),
          CustomButtonInfo(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            image: Assets.assetsImagesUser,
            title: '37'.tr,
            onPressed: () {
              Navigator.pushNamed(context, ProfileDetailsView.routeName);
            },
          ),

          const Divider(thickness: .7, color: Color(0xffDDDFDF)),
          CustomButtonInfo(
            icon: TextButton(
              onPressed: () {
                final isEnglish = Get.locale?.languageCode == 'en';
                final newLocale = isEnglish
                    ? const Locale('ar', 'SA')
                    : const Locale('en', 'US');
                Get.updateLocale(newLocale);
              },
              child: Text(
                Get.locale?.languageCode == 'en' ? 'العربية' : 'English',
                style: AppStyles.bold16.copyWith(color: const Color(0xff949d9e)),
              ),
            ),
            image: Assets.assetsImagesGlobal,
            title: Get.locale!.languageCode == 'en' ? 'Language' : 'اللغة',
            onPressed: () {
              final isEnglish = Get.locale!.languageCode == 'en';
              final newLocale = isEnglish
                  ? const Locale('ar', 'SA')
                  : const Locale('en', 'US');
              Get.updateLocale(newLocale);

              Get.snackbar(
                isEnglish ? "تم تغيير اللغة" : "Language Changed",
                isEnglish ? "تم التحويل إلى العربية" : "Switched to English",
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),

          const Divider(thickness: .7, color: Color(0xffDDDFDF)),
          CustomButtonInfo(
            icon: Obx(
              () => Icon(
                Get.find<ThemeController>().isDark.value
                    ? Icons.wb_sunny
                    : Icons.nightlight_round,
                color: Colors.amber,
              ),
            ),
            image: Assets.assetsImagesMagicpen,
            title: '39'.tr,

            onPressed: () {
              Get.find<ThemeController>().toggleTheme();
            },
          ),

          const Divider(thickness: .7, color: Color(0xffDDDFDF)),
          CustomButtonInfo(
            icon: const Icon(Icons.arrow_forward_ios_rounded),
            image: Assets.assetsImagesInfoCircle,
            title: '40'.tr,
            onPressed: () {
              Navigator.pushNamed(context, AboutUsView.routeName);
            },
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 246, 205, 205),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
             const   Spacer(),
                Text(
                  '36'.tr,
                  style: AppStyles.semiBold16.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, SignInView.routeName);
                  },
                  icon: const RotatedBox(
                    quarterTurns: 2,
                    child: Icon(
                      Icons.logout_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
