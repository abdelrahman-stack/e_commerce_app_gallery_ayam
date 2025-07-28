import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/dont_have_an_account_widget.dart';
import 'package:e_commerce_app/core/widgets/password_field.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    late String email, password;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(); 
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 40),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * 3.1416, 
                    child: child,
                  );
                },
                child: Image.asset(
                  Assets.assetsImagesGallery2,
                  height: 250,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('3'.tr, style: AppStyles.bold19),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: '8'.tr,
                inputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 16),
              PasswordFeild(onSaved: (value) {
                password = value!;
              }, ),
              const SizedBox(height: 16),
            
              const SizedBox(height: 16),
              CustomButton(
                text: '3'.tr,
                onPressed: () {
                    if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signinUser(
                          email,
                        password,
                        );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 16,),
              DontHaveAnAccountWidget(
                text1: '4'.tr,
                text2: '2'.tr,
                onTap: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
