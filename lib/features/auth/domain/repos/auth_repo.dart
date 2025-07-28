import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';


abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name, String phoneNumber);

  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password);



  Future addUserData({required UserEntity user});
  Future saveUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});

}