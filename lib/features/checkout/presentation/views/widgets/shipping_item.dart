import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';


class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.price,
    required this.isSelected, required this.onTAp,
  });
  final String title, price;
  final bool isSelected;
  final VoidCallback onTAp;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTAp,
      child: AnimatedContainer(
        duration:const  Duration(milliseconds: 300),
        padding:const EdgeInsets.only(top: 16, left: 13, right: 28, bottom: 16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color:const Color(0x7fF2F3F3),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ?const ActiveShippingitemdots() :const InactiveShippingitemdots(),
            const  SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppStyles.semiBold13),
                const  SizedBox(height: 6),
                
                ],
              ),
            const  Spacer(),
              Center(
                child: Text(
                  '$price جنيه',
                  style: AppStyles.bold13.copyWith(
                    color: AppColors.lightprimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InactiveShippingitemdots extends StatelessWidget {
  const InactiveShippingitemdots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration:const ShapeDecoration(
        shape: OvalBorder(side: BorderSide(width: 1, color: Color(0xff949d9e))),
      ),
    );
  }
}

class ActiveShippingitemdots extends StatelessWidget {
  const ActiveShippingitemdots({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration:const ShapeDecoration(
        color: AppColors.primaryColor,
        shape: OvalBorder(side: BorderSide(width: 4, color: Colors.white)),
      ),
    );
  }
}
