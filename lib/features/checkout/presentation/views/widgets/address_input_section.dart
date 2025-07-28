import 'package:e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,

        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
            const  SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress.name = value!;
                },
                hintText: '20'.tr,
                inputType: TextInputType.name,
              ),
            const  SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress.email = value!;
                },
                hintText: '8'.tr,
                inputType: TextInputType.emailAddress,
              ),
            const  SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress.city = value!;
                },
                hintText: '44'.tr,
                inputType: TextInputType.streetAddress,
              ),
            const  SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress.address = value!;
                },
                hintText: '45'.tr,
                inputType: TextInputType.streetAddress,
              ),
            const  SizedBox(height: 8),

              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress.addressDetails =
                      value!;
                },
                hintText: '46'.tr,
                inputType: TextInputType.streetAddress,
              ),
            const  SizedBox(height: 8),
              CustomTextFormField(
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress.phone = value!;
                },
                hintText: '47'.tr,
                inputType: TextInputType.phone,
              ),
            const  SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
