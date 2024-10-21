import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_zone/features/auth/data/models/user_model.dart';
import 'package:phone_zone/features/auth/domain/enities/user_entity.dart';
import 'package:phone_zone/features/auth/domain/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) => emit(
        SignupFailure(message: failure.message),
      ),
      (userEntity) => emit(
        SignupSuccess(userEntity: userEntity),
      ),
    );
  }

  Future<UserModel> fetchUserData({required String uId}) async {
    try {
      UserEntity userEntity = await authRepo.getUserData(uId: uId);
      UserModel userModel = UserModel(
        name: userEntity.name,
        email: userEntity.email,
        uId: userEntity.uId,
      );
      return userModel;
    } on Exception {
      throw (" خطأ في الحصول على البيانات");
    }
  }
}
