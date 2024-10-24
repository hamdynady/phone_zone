import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_zone/core/errors/exceptions.dart';
import 'package:phone_zone/core/errors/failures.dart';
import 'package:phone_zone/core/services/database_service.dart';
import 'package:phone_zone/core/services/firebase_auth_service.dart';
import 'package:phone_zone/core/utils/backend_endpoint.dart';
import 'package:phone_zone/features/auth/data/models/user_model.dart';
import 'package:phone_zone/features/auth/domain/enities/user_entity.dart';
import 'package:phone_zone/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExist, documentId: user.uid);
      isUserExists ? getUserData(uId: user.uid) : addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExist, documentId: user.uid);

      isUserExists ? getUserData(uId: user.uid) : addUserData(user: userEntity);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log("  Exception in AuthRepoImpl.signInWithFacebook: ${e.toString()}");
      deleteUser(user);
      return left(ServerFailure(
        'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      ));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await databaseService.checkIfDataExists(
          path: BackendEndpoint.isUserExist, documentId: user.uid);

      isUserExists ? getUserData(uId: user.uid) : addUserData(user: userEntity);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      log("  Exception in AuthRepoImpl.signInWithApple: ${e.toString()}");
      deleteUser(user);
      return left(ServerFailure(
        'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      ));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
      documentId: user.uId,
    );
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoint.getUserData, documentId: uId);
    return UserModel.fromJson(userData);
  }
}
