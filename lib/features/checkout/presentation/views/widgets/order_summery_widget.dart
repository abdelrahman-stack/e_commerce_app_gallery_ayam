import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      text: '50'.tr,

      child: Column(
        children: [
          Row(
            children: [
              Text('51'.tr, style: AppStyles.regular13),
            const  Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalprice()} جنيه',
                style: AppStyles.semiBold16,
              ),
            ],
          ),
        const  SizedBox(height: 8),
          Row(
            children: [
              Text('53'.tr, style: AppStyles.regular13),
            const  Spacer(),
              Text(
                '54'.tr,
                style: AppStyles.semiBold13.copyWith(color:const Color(0xff4E5556)),
              ),
            ],
          ),
      const    Divider(color: Color(0xffCACECE), height: 18, thickness: .7),
          Row(
            children: [
              Text('52'.tr, style: AppStyles.bold16),
          const    Spacer(),
              Text(
                ' ${context.read<OrderInputEntity>().cartEntity.calculateTotalprice()} جنيه + مصاريف الشحن ',
                style: AppStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
