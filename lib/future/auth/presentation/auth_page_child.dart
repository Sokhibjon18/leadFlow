import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/router/app_router.gr.dart';
import 'package:lead_flow/future/auth/domain/auth_bloc.dart';
import 'package:lottie/lottie.dart';

class AuthPageChild extends StatefulWidget {
  const AuthPageChild({super.key});

  @override
  State<AuthPageChild> createState() => _AuthPageChildState();
}

class _AuthPageChildState extends State<AuthPageChild> {
  late final bloc = context.read<AuthBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error.isNotEmpty) {
          context.router.replace(const HomeRoute());
          return;
          log(state.error.toString());
        }
        if (state.authenticated) {
          context.router.replace(const HomeRoute());
          return;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      const Text(
                        'eL',
                        style: TextStyle(
                          fontSize: 70,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'No code web-funnel builder with payment and analysis',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.purple),
                      ),
                      // Image.asset('assets/images/logo.png'),
                      SizedBox(
                          height: 250,
                          child: Lottie.asset('assets/images/auth.json')),
                      GestureDetector(
                        onTap: () =>
                            bloc.add(const AuthEvent.signInWithGoogle()),
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: const Text(
                            'Continue with Google',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
