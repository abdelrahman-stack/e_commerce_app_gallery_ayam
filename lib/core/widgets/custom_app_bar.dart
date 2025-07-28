import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: AppStyles.bold19),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.arrow_back_ios_new),
    ),
  );
}

AppBar buildCustomAppBar(
  BuildContext context, {
  required String title,
  bool showLeading = true,
  bool showNotification = true,
}) {
  return AppBar(
    leading: Visibility(
      visible: showLeading,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new, size: 22),
      ),
    ),
    title: Text(title, style: AppStyles.bold19),
    centerTitle: true,
  );
}
