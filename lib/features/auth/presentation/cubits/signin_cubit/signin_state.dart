import 'package:phone_zone/features/auth/domain/enities/user_entity.dart';

abstract class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity userEntity;

  SigninSuccess({required this.userEntity});
}

final class SigninFailure extends SigninState {
  final String message;

  SigninFailure({required this.message});
}
