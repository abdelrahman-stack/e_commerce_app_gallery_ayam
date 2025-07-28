import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});
static const String routeName = 'AboutUsView';
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('من نحن'), centerTitle: true),
        body: const SingleChildScrollView(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                '📌 من نحن',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'جاليري أيام هو أكثر من مجرد متجر…\nهو مساحة فنية بنحتفل فيها بالجمال، والإبداع، ولمسة "اليد" الأصيلة.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),

              Text(
                '🎯 رسالتنا',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'نسعى لإحياء الطابع اليدوي المميز في كل قطعة نقدمها – من مناديل كتب الكتاب الفاخرة، إلى الملابس المصنوعة بحب، والبصمات المصممة خصيصًا لكِ – لتكون كل لحظة… مليئة بالتفاصيل.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),

              Text(
                '💎 لماذا جاليري أيام؟',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '- منتجات هاند ميد 100% بجودة عالية\n'
                '- تصاميم خاصة ومميزة لكل مناسبة\n'
                '- نهتم بأدق التفاصيل لتصلك تجربة راقية وفريدة\n'
                '- دعم عملاء دائم وسريع',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),

              Text(
                '🤝 تواصل معنا',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '📱 01019340839\n📍 المنيا، مصر',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
