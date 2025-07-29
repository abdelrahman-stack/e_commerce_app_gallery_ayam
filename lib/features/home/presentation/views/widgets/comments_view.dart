import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/comments_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key, required this.itemId});

  static const routeName = 'comments';

  final String itemId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: '63'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: CommentsSection(itemId: itemId), 
      ),
    );
  }
}
