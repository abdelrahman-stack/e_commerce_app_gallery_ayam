

import 'package:e_commerce_app/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';

class OrderInputEntity {
  final String userEmail;
  final String userName;
  final String userPhoneNumber;
  final String uId;
  final CartEntity cartEntity;
  bool? paywithcash;
  ShippingAddressEntity shippingAddress;
  OrderInputEntity(

    this.cartEntity, {
    required this.userEmail,
    required this.userName,
    required this.userPhoneNumber,
    required this.uId,
    this.paywithcash,
    required this.shippingAddress,
  });

double calculateShippingCost() {
  if (paywithcash!) {
    return 30;
  } else {
    return 0;
  }
}

double calcualteShippingDiscount() {
  return 0;
}

double calculateTotalPriceAfterDiscountAndShipping() {
  return cartEntity.calculateTotalprice() +
      calculateShippingCost() -
      calcualteShippingDiscount();
}



}
