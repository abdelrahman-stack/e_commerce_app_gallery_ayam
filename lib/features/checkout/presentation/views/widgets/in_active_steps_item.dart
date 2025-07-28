import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class InActiveStepsItem extends StatelessWidget {
  const InActiveStepsItem({super.key, required this.index, required this.text});
  final String index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor:const Color(0xffF2F3F3),
          child: Text(index, style: AppStyles.semiBold13),
        ),
      const  SizedBox(width: 4),
        Text(
          text,
          style: AppStyles.semiBold13.copyWith(color: const Color(0xffAAAAAA)),
        ),
      ],
    );
  }
}
