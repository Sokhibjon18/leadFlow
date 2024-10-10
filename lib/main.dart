import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:web_funnel/core/di/injection.dart';
import 'package:web_funnel/core/gen/assets.gen.dart';
import 'package:web_funnel/core/gen/strings.dart';
import 'package:web_funnel/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: Strings.supportedLocales,
      path: Assets.localization.translations,
      fallbackLocale: Strings.supportedLocales.first,
      startLocale: Strings.supportedLocales.first,
      assetLoader: CsvAssetLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Web Funnel',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      routerConfig: getIt<AppRouter>().config(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
