import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/models/comment_model.dart';
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';

class CustomCommentsItem extends StatelessWidget {
  const CustomCommentsItem({super.key, required this.commentModel});
  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
  final dateTimeInEgypt = commentModel.createdAt.add(const Duration(hours: 3));

final formattedDate =
    '${dateTimeInEgypt.day}/${dateTimeInEgypt.month}/${dateTimeInEgypt.year} '
    '${dateTimeInEgypt.hour}:${dateTimeInEgypt.minute.toString().padLeft(2, '0')}';

    return Card(
      color: const Color.fromARGB(255, 241, 206, 206),
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  Assets.assetsImagesProfileImage,
                  height: 50,
                  width: 50,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(commentModel.name, style: AppStyles.semiBold16),
                      Text(
                        commentModel.email,
                        style: AppStyles.regular16.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('messages')
                        .doc(commentModel.id)
                        .delete();
                        
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(commentModel.message, style: AppStyles.regular16),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                formattedDate,
                style: AppStyles.regular16.copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteComment(String commentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('messages')
          .doc(commentId)
          .delete();
      print('Comment deleted successfully');
    } catch (e) {
      print('Failed to delete comment: $e');
    }
  }
}
