import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/di/injection.dart';
import 'package:lead_flow/future/auth/domain/auth_bloc.dart';
import 'package:lead_flow/future/auth/presentation/auth_page_child.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: const Scaffold(
        backgroundColor: Color(0xFFF0F2F5),
        body: AuthPageChild(),
      ),
    );
  }
}
