import 'package:phone_zone/core/services/firebase_auth_service.dart';
import 'package:phone_zone/features/auth/data/repos/auth_repo_impl.dart';
import 'package:phone_zone/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  // getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      // databaseService: getIt<DatabaseService>(),
    ),
  );
}
