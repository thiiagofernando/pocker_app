import 'package:get_it/get_it.dart';
import 'package:pocker_app/domain/usecases/sign_in_usecase.dart';
import '../../data/datasources/firebase_auth_datasource.dart';
import '../../data/repositories/firebase_auth_repository.dart';
import '../../presentation/viewmodels/login_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register DataSources
  getIt.registerLazySingleton<FirebaseAuthDataSource>(() => FirebaseAuthDataSource());

  // Register Repositories
  getIt.registerLazySingleton<FirebaseAuthRepository>(() => FirebaseAuthRepository(getIt<FirebaseAuthDataSource>()));

  // Register UseCases
  getIt.registerLazySingleton<SignInUsecase>(() => SignInUsecase(getIt<FirebaseAuthRepository>()));

  // Register ViewModels
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(getIt<SignInUsecase>()));
}
