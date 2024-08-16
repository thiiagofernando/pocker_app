import 'package:get_it/get_it.dart';
import 'package:pocker_app/domain/usecases/sign_in_usecase.dart';
import '../../data/datasources/firebase_auth_datasource.dart';
import '../../data/repositories/firebase_auth_repository.dart';
import '../../domain/usecases/get_current_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../presentation/viewmodels/auth_login_view_model.dart';
import '../../presentation/viewmodels/login_view_model.dart';
import '../../presentation/viewmodels/register_view_model.dart';
import '../../presentation/viewmodels/reset_password_view_model.dart';
import '../../presentation/viewmodels/use_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  // Register DataSources
  getIt.registerLazySingleton<FirebaseAuthDataSource>(() => FirebaseAuthDataSource());

  // Register Repositories
  getIt.registerLazySingleton<FirebaseAuthRepository>(() => FirebaseAuthRepository(getIt<FirebaseAuthDataSource>()));

  // Register UseCases
  getIt.registerLazySingleton<SignInUsecase>(() => SignInUsecase(getIt<FirebaseAuthRepository>()));
  getIt.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(getIt<FirebaseAuthRepository>()));
  getIt.registerLazySingleton<ResetPasswordUseCase>(() => ResetPasswordUseCase(getIt<FirebaseAuthRepository>()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt<FirebaseAuthRepository>()));
  getIt.registerLazySingleton<GetCurrentUserUseCase>(() => GetCurrentUserUseCase(getIt<FirebaseAuthRepository>()));

  // Register ViewModels
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(getIt<SignInUsecase>()));
  getIt.registerFactory<AuthViewModel>(() => AuthViewModel(getIt<SignOutUseCase>()));
  getIt.registerFactory<RegisterViewModel>(() => RegisterViewModel(getIt<RegisterUseCase>()));
  getIt.registerFactory<ResetPasswordViewModel>(() => ResetPasswordViewModel(getIt<ResetPasswordUseCase>()));
  getIt.registerFactory<UserViewModel>(() => UserViewModel(getIt<GetCurrentUserUseCase>()));
}
