import 'package:e_commerce_app/features/checkout/presentation/views/widgets/active_steps_item.dart';
import 'package:e_commerce_app/features/checkout/presentation/views/widgets/in_active_steps_item.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
  });
  final String text, index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InActiveStepsItem(index: index, text: text),
      secondChild: ActiveStepsItem(text: text),
      alignment: Alignment.center,
      crossFadeState: isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration:const Duration(milliseconds: 300),
    );
  }
}
