import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:e_commerce_app/core/utils/backend_endpoint.dart';
import 'package:e_commerce_app/features/checkout/data/models/order_model.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DatabaseService databaseService;

  OrderRepoImpl(this.databaseService);
  // @override
  // Future<Either<Failure, void>> addOrder({
  //   required OrderInputEntity order,
  // }) async {
  //   try {
  //     await databaseService.addData(
  //       path: BackendEndpoint.addOrder,
  //       data: OrderModel.fromEntity(order).toJson(),
  //     );
  //     return right(null);
  //   } catch (e) {
  //     return left(ServerFailure('failed to add order'));
  //   }
  // }

  @override
  Future<Either<Failure, void>> addOrder({
    required OrderInputEntity order,
  }) async {
    try {
      final data = OrderModel.fromEntity(order).toJson();

      final docRef = FirebaseFirestore.instance
          .collection(BackendEndpoint.addOrder)
          .doc();
      data['orderId'] = docRef.id;

      await docRef.set(data);

      return right(null);
    } catch (e) {
      return left(const ServerFailure('failed to add order'));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getUserOrders(String uId) async {
    try {
      final snapshot = await databaseService.getUserOrders(uId); // abstraction
      final orders = snapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList();
      return right(orders);
    } catch (e) {
      return left(ServerFailure('Failed to fetch orders: ${e.toString()}'));
    }
  }
}
