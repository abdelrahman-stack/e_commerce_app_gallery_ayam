import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/functions/get_user.dart';
import 'package:e_commerce_app/core/models/comment_model.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_comments_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsSection extends StatefulWidget {
  final String itemId;
  const CommentsSection({super.key, required this.itemId});

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  final TextEditingController controller = TextEditingController();
  final CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const SizedBox(height: 16),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: messages
                    .where('itemId', isEqualTo: widget.itemId)
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('حدث خطأ: ${snapshot.error}'));
                  }

                final comments = snapshot.data?.docs
    .map(
      (doc) => CommentModel.fromFirestore(doc),
    )
    .toList() ?? [];


                  if (comments.isEmpty) {
                    return  Center(
                      child: Text('64'.tr),
                    );
                  }

                  return ListView.builder(
                    reverse: true,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return CustomCommentsItem(commentModel: comments[index]);
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: controller,
              maxLines: null,
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                labelText: '65'.tr,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send, color: AppColors.primaryColor),
                  onPressed: sendComment,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.primaryColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendComment() async {
    final text = controller.text.trim();
    final user = FirebaseAuth.instance.currentUser;

    if (text.isEmpty) return;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يجب تسجيل الدخول أولًا لإرسال تعليق.')),
      );
      return;
    }

    try {
      final currentUser = getUser();
      if (currentUser == null) throw 'فشل في جلب بيانات المستخدم';

    await messages.add({
  'uid': user.uid,
  'message': text,
  'name': currentUser.name,
  'email': currentUser.email, 
  'createdAt': FieldValue.serverTimestamp(),
  'itemId': widget.itemId,
});


      controller.clear();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('فشل في إرسال التعليق: $e')));
    }
  }
}
