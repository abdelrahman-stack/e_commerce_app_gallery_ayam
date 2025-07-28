import 'package:e_commerce_app/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/shipping_section.dart';
import 'package:flutter/material.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueNotifier,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getPages().length,
      itemBuilder: (context, index) {
        return getPages()[index];
      },
    );
  }

  List<Widget> getPages() => [
    const ShippingSection(),
    AddressInputSection(formKey: formKey, valueListenable: valueNotifier),
    PaymentSection(pageController: pageController),
  ];
}
