import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';

import 'package:meta/meta.dart';

part 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;
Future<void> createUserWithEmailAndPassword({
  required String email,
  required String password,
  required String name,
  required String phone
}) async {
  emit(SignupLoading());

  final result = await authRepo.createUserWithEmailAndPassword(
 email,
     password,
     name,
     phone
  );

  result.fold(
    (l) {
      emit(SignupFailure(l.message));
    },
    (r) {
      emit(SignupSuccess(userEntity: r));
    },
  );
}

}
