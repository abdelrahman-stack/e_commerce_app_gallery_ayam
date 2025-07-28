
import 'package:e_commerce_app/core/widgets/build_error_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_progress_hud.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:e_commerce_app/features/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context, MainView.routeName);
        } else if (state is SigninFailure) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading,
          child: const SigninViewBody(),
        );
      },
    );
  }
}
