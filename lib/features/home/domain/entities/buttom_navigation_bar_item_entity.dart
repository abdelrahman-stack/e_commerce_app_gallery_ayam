
import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:get/get.dart';

class ButtomNavigationBarEntity {
  final String activeItem, inActiveItem;
  final String name;

  ButtomNavigationBarEntity({
    required this.activeItem,
    required this.inActiveItem,
    required this.name,
  });

}
  List<ButtomNavigationBarEntity> get buttomNavgationBarItems => [
    ButtomNavigationBarEntity(
      activeItem: Assets.assetsImagesHomeActive,
      inActiveItem: Assets.assetsImagesHomeInActive,
      name: '27'.tr,
    ),
    ButtomNavigationBarEntity(
      activeItem:  Assets.assetsImagesProductsActive,
      inActiveItem: Assets.assetsImagesProductsInActive,
      name: '28'.tr,
    ),
    ButtomNavigationBarEntity(
      activeItem: Assets.assetsImagesShoppingCardActive,
      inActiveItem: Assets.assetsImagesShoppingCartInActive,
      name: '29'.tr,
    ),
    ButtomNavigationBarEntity(
      activeItem: Assets.assetsImagesUserActive,
      inActiveItem: Assets.assetsImagesUserInActive,
      name: '30'.tr,
    ),
  ];