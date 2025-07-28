import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signup_cubits/signup_cubit_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: const Scaffold(
        
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
