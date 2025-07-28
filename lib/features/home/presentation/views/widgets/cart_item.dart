import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration:const BoxDecoration(color: Color(0xfff3f5f7)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Image.network(cartItemEntity.productEntity.imageUrl!),
                ),
              ),
            const  SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: AppStyles.bold13,
                        ),
                      const  Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCartItem(
                              cartItemEntity,
                            );
                          },
                          child: SvgPicture.asset(Assets.assetsImagesTrash),
                        ),
                      ],
                    ),
                    Text(
                      '${cartItemEntity.calcilateTotalPeices()} قطع',
                      style: AppStyles.regular13.copyWith(
                        color: AppColors.scondaryColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: cartItemEntity),
                      const  Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} جنيه ',
                          style: AppStyles.bold16.copyWith(
                            color: AppColors.scondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
