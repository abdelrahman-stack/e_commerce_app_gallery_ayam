import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';


class CartItemEntity extends Equatable{ 
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calculateTotalPrice() => productEntity.price * count;
  num calcilateTotalPeices() => productEntity.pices * count;
  increasCount() => count++;
  decreasCount() => count--;
  
  @override
  
  List<Object?> get props => [productEntity];
}