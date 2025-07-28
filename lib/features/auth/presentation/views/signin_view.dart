import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'signin';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: const Scaffold(
        backgroundColor: Color(0xffffeeec),

        body:  SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
