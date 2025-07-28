import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
 final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: Icons.add,
          color: AppColors.primaryColor,
          iconColor: Colors.white,
          onTap: (){
            cartItemEntity.increasCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(cartItemEntity.count.toString(), style: AppStyles.bold16, textAlign: TextAlign.center,),
        ),
        CartItemActionButton(
          icon: Icons.remove,
          color:const Color(0xffF3F5F7),
          iconColor: Colors.grey,
          onTap: (){
            cartItemEntity.decreasCount();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(2),
        width: 24,
        height: 24,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        child: FittedBox(child: Icon(icon, color: iconColor)),
      ),
    );
  }
}
