import 'package:e_commerce_app/features/home/domain/entities/buttom_navigation_bar_item_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/active_item.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/in_active_item.dart';
import 'package:flutter/material.dart';


class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isActive,
    required this.buttomNavigationBarEntity,
  });
  final bool isActive;
  final ButtomNavigationBarEntity buttomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(
          image: buttomNavigationBarEntity.activeItem,
          text: buttomNavigationBarEntity.name,
        )
        : InActiveItem(image: buttomNavigationBarEntity.inActiveItem);
  }
}
