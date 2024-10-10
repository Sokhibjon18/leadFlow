import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:web_funnel/core/di/injection.config.dart';
import 'package:web_funnel/core/router/app_router.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
  getIt.registerLazySingleton(() => AppRouter());
}
