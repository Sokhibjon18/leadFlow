import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lead_flow/features/funnel_builder/funnel_builder_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lead Flow',
      debugShowCheckedModeBanner: false,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      theme: ThemeData(useMaterial3: true),
      home: const FunnelBuilderPage(),
    );
  }
}
