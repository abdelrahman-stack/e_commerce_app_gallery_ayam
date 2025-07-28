import 'package:e_commerce_app/core/widgets/build_error_bar.dart';
import 'package:e_commerce_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this.currentViewIndex});

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          showBar(context, '60'.tr);
        }
        if (state is CartItemRemoved) {
          showBar(context, '61'.tr);
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
