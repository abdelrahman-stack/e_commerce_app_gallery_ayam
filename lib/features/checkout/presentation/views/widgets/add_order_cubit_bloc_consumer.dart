import 'package:e_commerce_app/core/widgets/build_error_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_progress_hud.dart';
import 'package:e_commerce_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  const AddOrderCubitBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          showBar(context, 'تمت العملية بنجاح');
        } else if (state is AddOrderFailure) {
          showBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddOrderLoading ? true : false,
          child: child,
        );
      },
    );
  }
}
