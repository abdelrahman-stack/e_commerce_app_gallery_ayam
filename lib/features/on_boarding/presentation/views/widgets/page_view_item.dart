import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
  });
  final String title, image, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: AppStyles.bold19),
          const SizedBox(height: 100),
          Image.asset(image),
          const SizedBox(height: 74),
          Text(
            subtitle,
            style: AppStyles.semiBold16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
