import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';

import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signinUser(   String email,
     String password,
  
  ) async {
    emit(SigninLoading());
    var result = await authRepo.signinWithEmailAndPassword(
   email,
     password,
    );
    result.fold(
      (l) => emit(SigninFailure(l.message)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  


}
