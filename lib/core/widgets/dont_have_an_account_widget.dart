import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';


class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key, required this.text1, required this.text2, this.onTap});
  final String text1 , text2;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: AppStyles.semiBold16.copyWith(color:const Color(0xff949D9E)),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: AppStyles.semiBold16.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
