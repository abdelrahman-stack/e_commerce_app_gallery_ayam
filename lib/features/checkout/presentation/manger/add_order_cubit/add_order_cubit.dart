import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:equatable/equatable.dart';


part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final OrderRepo orderRepo;
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());

Future<void> addOrder({required OrderInputEntity order}) async {
  emit(AddOrderLoading());
  final result = await orderRepo.addOrder(order: order);
  result.fold(
    (l) => emit(AddOrderFailure(l.message)),
    (r) => emit(AddOrderSuccess()),
  );
}

}
