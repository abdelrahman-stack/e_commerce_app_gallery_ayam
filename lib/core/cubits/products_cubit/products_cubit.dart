
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepo productRepo;
  int productsLength = 0;
  ProductsCubit(this.productRepo) : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) {
        productsLength = products.length;
        emit(ProductsSuccess(products));
      },
    );
  }

    Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.message)),
      (products) => emit(ProductsSuccess(products)),
    );
  }
}
