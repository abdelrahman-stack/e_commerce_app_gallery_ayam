import 'package:e_commerce_app/features/checkout/data/models/order_product_model.dart';
import 'package:e_commerce_app/features/checkout/data/models/shipping_address_model.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  
  final String orderId;
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.orderId,
    required this.uId,

    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'] ?? '',
      totalPrice: json['totalPrice'],
      uId: json['uId'],
      shippingAddressModel: ShippingAddressModel.fromJson(
        json['shippingAddressModel'],
      ),
      orderProducts: json['orderProducts']
          .map((e) => OrderProductModel.fromJson(e))
          .toList(),
      paymentMethod: json['paymentMethod'],
    );
  }

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) {
    return OrderModel(
      orderId: '',
      totalPrice: orderEntity.cartEntity.calculateTotalprice(),
      uId: orderEntity.uId,
      shippingAddressModel: ShippingAddressModel.fromEntity(
        orderEntity.shippingAddress,
      ),
      orderProducts: orderEntity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
          .toList(),
      paymentMethod: orderEntity.paywithcash! ? 'Cash' : 'Paypal',
    );
  }
  toJson() => {
    'orderId': orderId,
    'totalPrice': totalPrice,
    'uId': uId,
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };
}



// payment method