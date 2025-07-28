import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFF6CDCD)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '33'.tr,
              style: AppStyles.regular13.copyWith(color: AppColors.primaryColor),
            ),
            Text(
              ' ${context.watch<CartCubit>().cartEntity.cartItems.length} ',
              style: AppStyles.regular13.copyWith(color: AppColors.primaryColor),
            ),
            Text(
              '34'.tr,
              style: AppStyles.regular13.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
