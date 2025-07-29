import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_network_image.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HandmadeItem extends StatelessWidget {
  const HandmadeItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color:const Color(0xFFF5E2E7),
      ),
      child: Stack(
        children: [
          // Positioned(
          //   right: 0,
          //   top: 0,
          //   child: IconButton(
          //     onPressed: () {},
          //     icon:const Icon(Icons.favorite_border_outlined),
          //   ),
          // ),
          Positioned(

            child: Column(
              children: [
              const  SizedBox(height: 4),
                productEntity.imageUrl != null
                    ? Flexible(
                        child: CustomNetworkImage(
                          imageUrl: productEntity.imageUrl!,
                        ),
                      )
                    : Container(color: Colors.grey, height: 100, width: 100),
              const  SizedBox(height: 16),
                ListTile(
                  title: Text(
                    productEntity.name,
                    style: AppStyles.semiBold13,
                    textAlign: TextAlign.right,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.price} جنية',
                          style: AppStyles.bold13.copyWith(
                            color: AppColors.scondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addProducts(productEntity);
                    },
                    child:const CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
