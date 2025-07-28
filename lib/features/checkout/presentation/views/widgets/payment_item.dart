import 'package:e_commerce_app/core/utils/app_decorations.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';


class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.text, required this.child});
  final String text;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(text, style: AppStyles.bold13),
      const  SizedBox(height: 8),
        Container(
          padding:const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
          decoration: AppDecorations.greyBoxDecoration, child: child),
      ],
    );
  }
}
