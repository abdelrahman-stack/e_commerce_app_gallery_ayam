import 'package:e_commerce_app/features/on_boarding/presentation/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const routeName = 'onboarding';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body:  OnBoardingViewBody());
  }
}
