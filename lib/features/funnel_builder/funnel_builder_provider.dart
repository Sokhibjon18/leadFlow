import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/features/funnel_builder/domain/funnel_builder_cubit.dart';
import 'package:lead_flow/features/funnel_builder/funnel_builder_body.dart';

@RoutePage()
class FunnelBuilderProviderPage extends StatelessWidget {
  const FunnelBuilderProviderPage({super.key, this.appName});

  final String? appName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: BlocProvider(
        create: (_) => FunnelBuilderCubit(),
        child: FunnelBuilderBody(projectName: 'App Name'),
      ),
    );
  }
}
