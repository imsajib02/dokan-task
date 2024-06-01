import 'package:get_it/get_it.dart';

import '../barrels/repositories.dart';

final getIt = GetIt.instance;

void registerServices() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
}
