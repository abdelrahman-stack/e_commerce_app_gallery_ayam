import 'package:e_commerce_app/core/widgets/build_error_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          text:
              'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalprice()} جنيه', 
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              Navigator.pushNamed(
                context,
                CheckoutView.routeName,
                arguments: context.read<CartCubit>().cartEntity,
              );
            } else {
              showBar(context, '35'.tr);
            }
          },
        );
      },
    );
  }
}
