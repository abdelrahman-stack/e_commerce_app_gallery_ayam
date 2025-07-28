import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          title: '12'.tr,
          image: Assets.assetsImagesScreenshot1,
          subtitle:
              '13'.tr,
        ),
        PageViewItem(
          title: '14'.tr,
          image: Assets.assetsImagesScreenshot2,
          subtitle:
              '15'.tr,
        ),
        PageViewItem(
          title: '16'.tr,
          image: Assets.assetsImagesScreenshot3,
          subtitle:
              '17'.tr,),
        PageViewItem(
          title: '18'.tr,
          image: Assets.assetsImagesScreenshot4,
          subtitle:
              '19'.tr,),
      ],
    );
  }
}
