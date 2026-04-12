import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:koto/core/theme/theme_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  // TODO: Registrar repositórios, cubits, datasources
  // Exemplo:
  // sl.registerLazySingleton<EmailRepository>(() => EmailRepositoryImpl(sl()));
  // sl.registerFactory(() => InboxCubit(sl()));

   sl.registerLazySingleton(() => FlutterSecureStorage());
  sl.registerSingleton<ThemeCubit>(ThemeCubit(sl<FlutterSecureStorage>()));
  await sl<ThemeCubit>().loadTheme();
}