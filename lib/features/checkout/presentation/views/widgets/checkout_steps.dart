import 'package:e_commerce_app/features/checkout/presentation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentpageindex, required this.pageController});
 final int currentpageindex;
 final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              pageController.animateToPage(index,
                  duration:const Duration(milliseconds: 300), curve: Curves.linear);
            },
            child: StepItem(
              isActive: index <= currentpageindex,
              index: (index + 1).toString(),
              text: getSteps()[index],
            ),
          ),
        );
      }),
    );
  }

  
}
List<String> getSteps() {
    return ['48'.tr, '45'.tr, '49'.tr, ];
  }