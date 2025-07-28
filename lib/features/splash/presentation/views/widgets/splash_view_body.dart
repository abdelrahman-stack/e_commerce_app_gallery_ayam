import 'package:e_commerce_app/core/constant/constants.dart';
import 'package:e_commerce_app/core/services/firebsae_auth_service.dart';
import 'package:e_commerce_app/core/services/shared_preferance_singleton.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/features/auth/presentation/views/signin_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/main_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/language_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigatoer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Image.asset(Assets.assetsImagesFlower, height: 250)],
        ),

        Image.asset(Assets.assetsImagesGallery2),
        const Spacer(),
      ],
    );
  }

  void excuteNavigatoer() {
    bool isOnBoaringViewSeen = Prefs.getBool(kIsOnBoaringViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoaringViewSeen) {
        var isLoggedIn = FirebaseAuthService().isLoggedIn();

        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, LanguageView.routeName);
      }
    
    });
  }
}
