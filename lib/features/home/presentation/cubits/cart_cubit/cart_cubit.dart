import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/cart_item_entity.dart';

import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity([]);

  void addProducts(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var cartitem = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      cartitem.increasCount();
    } else {
      cartEntity.addCartItem(cartitem);
    }

    emit(CartItemAdded());
  }

  void deleteCartItem(CartItemEntity cartItem) {
    cartEntity.deleteCartItem(cartItem);
    emit(CartItemRemoved());
  }
}
