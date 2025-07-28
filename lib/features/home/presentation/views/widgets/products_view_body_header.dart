import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsViewBodyHeader extends StatelessWidget {
  const ProductsViewBodyHeader({super.key, required this.productsLength});
  final int productsLength;
  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [
        Text(
          ' $productsLength  ',
          style: AppStyles.bold16,
        ),
        Text(
          '31'.tr,
          style: AppStyles.bold16,
        ),
      ],
    );
  }
}
