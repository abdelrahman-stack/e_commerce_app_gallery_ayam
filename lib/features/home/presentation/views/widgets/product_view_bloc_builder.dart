import 'package:e_commerce_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:e_commerce_app/core/functions/get_dummy_product.dart';
import 'package:e_commerce_app/core/widgets/custom_error_widget.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductGridViewBlocBuilder extends StatelessWidget {
  const ProductGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(child: CustomErrorWidget(text: state.errMessage));
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGridView(
              products: getDummyProducts(),
            ));
        }
      },
    );
  }
}
