import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  // TODO: Registrar repositórios, cubits, datasources
  // Exemplo:
  // sl.registerLazySingleton<EmailRepository>(() => EmailRepositoryImpl(sl()));
  // sl.registerFactory(() => InboxCubit(sl()));
}