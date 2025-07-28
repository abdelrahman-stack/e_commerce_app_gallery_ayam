import 'package:e_commerce_app/core/widgets/custom_divider_widget.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';


class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
 final List<CartItemEntity> cartItems ;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) =>const CustomDividerWidget(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
        child:  CartItem(
          cartItemEntity: cartItems[index],
        ),
      ),
      
    );
  }
}

