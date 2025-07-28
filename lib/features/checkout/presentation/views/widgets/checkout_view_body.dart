import 'package:e_commerce_app/core/widgets/build_error_bar.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/features/checkout/presentation/manger/add_order_cubit/add_order_cubit.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';
import 'package:e_commerce_app/features/home/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutSteps(
            pageController: pageController,
            currentpageindex: currentPageIndex,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              valueNotifier: valueNotifier,
              formKey: _formKey,
              pageController: pageController,
            ),
          ),
          CustomButton(
            text: getNextPageText(currentPageIndex),
            onPressed: () async {
              if (currentPageIndex == 0) {
                _handleShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                _handleShippingAddressValidation(context);
              } else {
                await _confirmOrder(context);
              }
            },
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderInputEntity>().paywithcash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      showBar(context, '58'.tr);
    }
  }

  getNextPageText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return '10'.tr;
      case 1:
        return '10'.tr;
      case 2:
        return '57'.tr;

      default:
        return '10'.tr;
    }
  }

  void _handleShippingAddressValidation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  Future<void> _confirmOrder(BuildContext context) async {
    var addOrderCubit = context.read<AddOrderCubit>();
    var orderEntity = context.read<OrderInputEntity>();

    await addOrderCubit.addOrder(order: orderEntity);

    showBar(context, '59'.tr);

  Navigator.pushNamedAndRemoveUntil(context, MainView.routeName, (route) => false);
  }
}
