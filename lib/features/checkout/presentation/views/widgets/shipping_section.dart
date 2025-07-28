import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
      const    SizedBox(height: 24),
          ShippingItem(
            onTAp: () {
              selectedIndex = 0;
              setState(() {});
              context.read<OrderInputEntity>().paywithcash = true;
            },
            isSelected: selectedIndex == 0,
            title: '43'.tr,
            price: context
                .read<OrderInputEntity>()
                .cartEntity
                .calculateTotalprice()
                .toString(),
          ),
        const  SizedBox(height: 16),
        
        ],
      ),
    );
  }
  
  @override
  
  bool get wantKeepAlive => true;
}
