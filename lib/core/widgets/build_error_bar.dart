
  import 'package:flutter/material.dart';

void showBar(BuildContext context, message) {
      ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      
      SnackBar(
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,

        content: Text(message)));
  }

