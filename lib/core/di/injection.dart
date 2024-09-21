import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lead_flow/core/router/app_router.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
GetIt configureDependencies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  return getIt.init();
}
