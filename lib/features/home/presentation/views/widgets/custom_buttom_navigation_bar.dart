import 'package:e_commerce_app/features/home/domain/entities/buttom_navigation_bar_item_entity.dart';
import 'package:e_commerce_app/features/home/presentation/views/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomButtomNavigationBar extends StatefulWidget {
  const CustomButtomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;
  @override
  State<CustomButtomNavigationBar> createState() =>
      _CustomButtomNavigationBarState();
}

class _CustomButtomNavigationBarState extends State<CustomButtomNavigationBar> {
  int actinIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        shadows: [
          BoxShadow(
            offset: Offset(0, -2),
            spreadRadius: 0,
            color: Color(0x3F000000),
            blurRadius: 25,
          ),
        ],
        color: Color(0xffEEF8ED),
      ),
      child: Row(
        children: buttomNavgationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: index == actinIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  actinIndex = index;
                  widget.onItemTapped(index);
                });
              },
              child: NavigationBarItem(
                isActive: actinIndex == index,
                buttomNavigationBarEntity: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
