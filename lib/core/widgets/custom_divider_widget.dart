
import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 22,
      color: Color.fromARGB(255, 231, 231, 233),
    );
  }
}