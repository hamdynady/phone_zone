import 'package:dartz/dartz.dart';
import 'package:phone_zone/core/errors/failures.dart';
import 'package:phone_zone/features/auth/domain/enities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, UserEntity>> signinWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, UserEntity>> signinWithApple();
  Future addUserData({required UserEntity user});
}
