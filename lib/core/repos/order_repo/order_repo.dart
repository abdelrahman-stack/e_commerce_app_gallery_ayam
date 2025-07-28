import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/checkout/data/models/order_model.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrder({required OrderInputEntity order});
  Future<Either<Failure, List<OrderModel>>> getUserOrders(String uId);
}
