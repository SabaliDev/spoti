import 'package:get_it/get_it.dart';
import 'package:spoti/data/repository/auth/auth_repository_impl.dart.dart';
import 'package:spoti/data/sources/auth/auth_firebase_service.dart';
import 'package:spoti/domain/repository/auth/auth.dart';
import 'package:spoti/domain/usecases/auth/sign_up.dart';

final sl = GetIt.instance;

Future<void> intializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
}
