import 'package:e_commerce_app/core/constant/constants.dart';
import 'package:e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/product_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const  SizedBox(height: kTopPadding),
              const  CustomHomeViewAppBar(),
              const  SizedBox(height: 16),

                Container(
                  padding:const EdgeInsets.symmetric(vertical: 2),
                  color:const Color(0xFFF6CDCD),
                  height: 30,
                  child: Marquee(
                    text:
                        ' 🔥🔥 أهلاً بك في تطبيقنا — تابع آخر التحديثات والعروض الجديدة..للاستفسار يرجى التواصل على هذا الرقم  01019340839',
                    style: AppStyles.bold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    
                    scrollAxis: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    blankSpace: 20.0,
                    velocity: 50.0,
                    pauseAfterRound: Duration.zero,
                    startPadding: 10.0,
                    accelerationDuration:const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration:const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                  ),
                ),

            const    SizedBox(height: 16),
              ],
            ),
          ),
         const  ProductGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
