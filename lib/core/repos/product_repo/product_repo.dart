import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/errors/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
    Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();

}