import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ShippinAdrressWidget extends StatelessWidget {
  const ShippinAdrressWidget({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      text: '55'.tr,

      child: Row(
        children: [
          SvgPicture.asset(Assets.assetsImagesLocation),
        const  SizedBox(width: 8),
          Text(
            '${context.read<OrderInputEntity>().shippingAddress}',
            style: AppStyles.regular16,
          ),
      const    Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(1,
                  duration:const Duration(milliseconds: 300), curve: Curves.linear);
            },
            child: Row(
              children: [
                SvgPicture.asset(Assets.assetsImagesPin),
              const  SizedBox(width: 4),
                Text(
                  '56'.tr,
                  style: AppStyles.semiBold13.copyWith(color:const Color(0xff949D9E)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
