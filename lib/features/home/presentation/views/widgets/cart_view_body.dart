import 'package:e_commerce_app/core/constant/constants.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_divider_widget.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_header.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_item_list.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                const  SizedBox(height: kTopPadding),
                  buildAppBar(context, title: '32'.tr),
                const  SizedBox(height: 16),
                const  CartHeader(),

                const  SizedBox(height: 16),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ?const SizedBox()
                  :const CustomDividerWidget(),
            ),
            CartItemList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ?const SizedBox()
                  :const CustomDividerWidget(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * 0.06,
          child:const CustomCartButton(),
        ),
      ],
    );
  }
}
