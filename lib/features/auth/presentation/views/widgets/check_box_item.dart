import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class CheckBoxItem extends StatefulWidget {
  const CheckBoxItem({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;
  @override
  State<CheckBoxItem> createState() => _CheckBoxItemState();
}

class _CheckBoxItemState extends State<CheckBoxItem> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChecked(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '22'.tr,
                  style: AppStyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: '23'.tr,
                  style: AppStyles.semiBold13.copyWith(
                    color: AppColors.lightprimaryColor,
                  ),
                ),
                const TextSpan(text: ' ', style: AppStyles.semiBold13),
                TextSpan(
                  text: '24'.tr,
                  style: AppStyles.semiBold13.copyWith(
                    color: AppColors.lightprimaryColor,
                  ),
                ),
                const TextSpan(text: ' ', style: AppStyles.semiBold13),
                TextSpan(
                  text: '25'.tr,
                  style: AppStyles.semiBold13.copyWith(
                    color: AppColors.lightprimaryColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
