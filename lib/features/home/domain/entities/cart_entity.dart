

import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity( this.cartItems);

  addCartItem(CartItemEntity cartItemEntity) => cartItems.add(cartItemEntity);
  deleteCartItem(CartItemEntity cartItem){
    cartItems.remove(cartItem);
  }

  bool isExist(ProductEntity products){
    
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == products) {
        return true;
      } 
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity products){
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == products) {
        return cartItem;
      } 
    }
    return CartItemEntity(productEntity: products, count: 1);
  }
  double calculateTotalprice(){
    double total = 0;
    for (var cartItem in cartItems) {
      total += cartItem.calculateTotalPrice();
    }
    return total;
  }
}