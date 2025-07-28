import 'package:e_commerce_app/core/functions/get_user.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});
  static const routeName = 'profile_details_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildCustomAppBar(context, title: '37'.tr),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title:  Text('41'.tr),
              subtitle: Text(getUser()!.name),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.email),
              title:  Text('8'.tr),
              subtitle: Text(getUser()!.email),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.phone),
              title:  Text('42'.tr),
              subtitle: Text(getUser()!.phoneNumber),
            ),
          ),
          
        ],
      ),
    ),
    );
  }
}
