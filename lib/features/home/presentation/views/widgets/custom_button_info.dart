
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtonInfo extends StatelessWidget {
  const CustomButtonInfo({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed, required this.icon,
  });
  final String title, image;
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(image),
      const  SizedBox(width: 8),
        Text(
          title,
          style: AppStyles.semiBold13.copyWith(color:const Color(0xff949d9e)),
        ),
      const  Spacer(),
        IconButton(
          onPressed:onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
