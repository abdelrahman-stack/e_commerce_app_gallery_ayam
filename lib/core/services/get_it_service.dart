
import 'package:e_commerce_app/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce_app/core/repos/order_repo/order_repo_impl.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo.dart';
import 'package:e_commerce_app/core/repos/product_repo/product_repo_impl.dart';
import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:e_commerce_app/core/services/firebsae_auth_service.dart';
import 'package:e_commerce_app/core/services/firestore_service.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(getIt<DatabaseService>()),
  );
  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpl(getIt<DatabaseService>()),
  );
}
