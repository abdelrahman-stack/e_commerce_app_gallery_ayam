import 'package:e_commerce_app/core/functions/get_user.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomHomeViewAppBar extends StatelessWidget {
  const CustomHomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.assetsImagesProfileImage),
      title: Text(
        '26'.tr,
        style: AppStyles.regular16.copyWith(color:const Color(0xff949D9E)),
      ),
      subtitle: Text(getUser()!.name, style: AppStyles.bold16,),
    
    );
  }
}