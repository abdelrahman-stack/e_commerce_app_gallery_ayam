import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/comments_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsItemView extends StatelessWidget {
  const DetailsItemView({super.key, required this.productEntity});
  static const routeName = 'details_item_view';
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: '62'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Image.network(
              productEntity.imageUrl!,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  productEntity.name,
                  style: AppStyles.bold19,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${productEntity.price} جنية',
                        style: AppStyles.bold16.copyWith(
                          color: AppColors.scondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(color: Color(0xffCACECE), height: 24, thickness: .7),
            Center(
              child: Text(
                productEntity.description,
                maxLines: 5,
                style: AppStyles.semiBold16.copyWith(
                  color: const Color(0xff979899),
                ),
              ),
            ),
            const SizedBox(height: 16),

            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                CommentsView.routeName,
                arguments: productEntity.code,
              ),
              child: Text(
                '63'.tr,
                style: AppStyles.semiBold16.copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5,
                  decorationColor: AppColors.primaryColor, 
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
