import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class PasswordFeild extends StatefulWidget {
  const PasswordFeild({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordFeild> createState() => _PasswordFeildState();
}

class _PasswordFeildState extends State<PasswordFeild> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      inputType: TextInputType.visiblePassword,
      hintText: '9'.tr,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ?const Icon(Icons.remove_red_eye, color: Color(0xffC9CECF))
            :const Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
      ),
    );
  }
}
