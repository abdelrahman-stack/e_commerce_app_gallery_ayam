import 'package:e_commerce_app/features/auth/presentation/views/signin_view.dart';
import 'package:e_commerce_app/features/auth/presentation/views/signup_view.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/main_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/about_us_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/profile_details_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/language_view.dart';
import 'package:e_commerce_app/features/on_boarding/presentation/views/onboarding_view.dart';
import 'package:e_commerce_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
        case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case ProfileDetailsView.routeName:
      return MaterialPageRoute(builder: (context) => const ProfileDetailsView());

    case LanguageView.routeName:
      return MaterialPageRoute(builder: (context) => const LanguageView());
    
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
      case AboutUsView.routeName:
      return MaterialPageRoute(builder: (context) => const AboutUsView());
      


    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
        case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) =>  CheckoutView(
        cartEntity: settings.arguments as CartEntity,
        
      ));

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
