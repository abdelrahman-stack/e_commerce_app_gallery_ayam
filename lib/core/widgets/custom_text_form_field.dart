import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    
    super.key,
    this.inputType,
    required this.hintText,
    this.suffixIcon, this.onSaved,  this.obscureText = false,
  });
  final TextInputType? inputType;
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      obscureText:obscureText,
      onSaved: onSaved,
      validator: (value) => value!.isEmpty ? 'هذا الحقل مطلوب' : null,
      keyboardType: inputType,
      decoration: InputDecoration(
        label: Text(hintText, style: AppStyles.bold13.copyWith(color: AppColors.primaryColor)),
        suffixIcon: suffixIcon,
        
        hintStyle: AppStyles.bold13,
        filled: true,
        fillColor:const Color(0xfff9fafa),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide:const BorderSide(width: 1, color: Color(0xffe6e9e9)),
    );
  }
}
