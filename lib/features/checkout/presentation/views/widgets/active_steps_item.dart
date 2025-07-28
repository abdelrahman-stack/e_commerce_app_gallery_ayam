import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';


class ActiveStepsItem extends StatelessWidget {
  const ActiveStepsItem({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const  CircleAvatar(
          radius: 12,
          backgroundColor: AppColors.primaryColor,
          child: Icon(Icons.check, color: Colors.white, size: 18),
        ),
      const  SizedBox(width: 4),
        Text(
          text,
          style: AppStyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
