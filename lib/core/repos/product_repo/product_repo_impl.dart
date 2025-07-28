import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo.dart';
import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:e_commerce_app/core/utils/backend_endpoint.dart';


class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
      try {
      var data =
          await databaseService.getData(path: BackendEndpoint.getProducts,
          query: {
            'orderBy': 'bestSelling',
            'descending': true,
            'limit': 10

          }
          
          
          )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    }  catch (e) {
      return left(const ServerFailure('failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    }  catch (e) {
      return left(const ServerFailure('failed to get products'));
    }
  }
}
