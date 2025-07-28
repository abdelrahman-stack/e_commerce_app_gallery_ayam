import 'dart:convert';

import 'package:e_commerce_app/core/constant/constants.dart';
import 'package:e_commerce_app/core/services/shared_preferance_singleton.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';


UserEntity? getUser() {
  var jsonString = Prefs.getString(kUserData);
  if (jsonString == null || jsonString.isEmpty) return null;
   var userEntity = UserModel.fromJson(jsonDecode(jsonString));
   return userEntity;
}

