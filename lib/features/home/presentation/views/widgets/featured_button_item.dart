import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FeaturedButtonItem extends StatelessWidget {
  const FeaturedButtonItem({super.key, this.onPressed});
 final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
    
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),),
        ),
        onPressed: onPressed,
        child: Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 24,),
          child: FittedBox(
            child: Text(
              'تسوق الان',
              style: AppStyles.bold13.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}