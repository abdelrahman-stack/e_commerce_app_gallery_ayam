import 'package:e_commerce_app/core/constant/constants.dart';
import 'package:e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/product_view_bloc_builder.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_view_body_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: kTopPadding),
                buildCustomAppBar(context, title: '28'.tr, showLeading: false),
                const SizedBox(height: 16),

                ProductsViewBodyHeader(
                   productsLength: context.watch<ProductsCubit>().productsLength,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const ProductGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
