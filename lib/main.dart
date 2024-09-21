import 'package:firebase_core/firebase_core.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lead_flow/core/app_widget.dart';
import 'package:lead_flow/core/di/injection.dart';
import 'package:lead_flow/features/funnel_builder/presentation/funnel_builder_page.dart';
import 'package:lead_flow/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(const AppWidget());
}
