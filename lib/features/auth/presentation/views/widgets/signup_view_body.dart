import 'package:e_commerce_app/core/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/core/widgets/dont_have_an_account_widget.dart';
import 'package:e_commerce_app/core/widgets/password_field.dart';
import 'package:e_commerce_app/features/auth/presentation/cubits/signup_cubits/signup_cubit_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/views/widgets/check_box_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late bool isTermsAccepted = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;
  late String name;
  late String phone;

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
            const  SizedBox(height: 40),
              buildCustomAppBar(context, title: '2'.tr),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: '20'.tr,
                inputType: TextInputType.name,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: '47'.tr,
                inputType: TextInputType.phone,
                onSaved: (value) {
                  phone = value!;
                },
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
              PasswordFeild(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              CheckBoxItem(
                onChecked: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: '2'.tr,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                            name: name,
                            phone: phone,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('يرجى قبول الشروط والأحكام'),
                        ),
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 8),
              DontHaveAnAccountWidget(
                text1: '21'.tr,
                text2: '3'.tr,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
