import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/auth/presentation/views/signin_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPageIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnboardingPageView(pageController: pageController),
        Positioned(
          bottom: 140,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              final isActive = index <= currentPageIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.primaryColor
                      : AppColors.primaryColor.withAlpha(70),
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 16,
          right: 16,
          child: CustomButton(
            text: getNextPageText(currentPageIndex),
            onPressed: () {
              if (currentPageIndex == 0) {
                pageController.animateToPage(
                  currentPageIndex + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              } else if (currentPageIndex == 1) {
                pageController.animateToPage(
                  currentPageIndex + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              } else if (currentPageIndex == 2) {
                pageController.animateToPage(
                  currentPageIndex + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              } else {
                Navigator.pushNamed(context, SignInView.routeName);
              }
            },
          ),
        ),
      ],
    );
  }

  getNextPageText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return '10'.tr;
      case 1:
        return '10'.tr;
      case 2:
        return '10'.tr;
      case 3:
        return '11'.tr;

      default:
        return '10'.tr;
    }
  }
}
