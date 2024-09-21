import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/router/app_router.gr.dart';
import 'package:lead_flow/core/widgets/commons/common_text_filed.dart';
import 'package:lead_flow/features/auth/domain/auth_cubit.dart';
import 'package:lead_flow/utils/extensions.dart';
import 'package:lottie/lottie.dart';

class AuthPageChild extends StatelessWidget {
  const AuthPageChild({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: _authStateListener,
      builder: (context, state) => _buildAuthContent(context),
    );
  }

  void _authStateListener(BuildContext context, AuthState state) {
    if (state.error.isNotEmpty) {
      context.showSnackBar(state.error);
    } else if (state.authenticated) {
      context.router.replace(HomeRoute());
    }
  }

  Widget _buildAuthContent(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              logoAndTitle(),
              SizedBox(
                height: 250,
                child: Lottie.asset('assets/images/auth.json'),
              ),
              const SizedBox(height: 16),
              _AuthForm(),
            ],
          ),
        ),
      ),
    );
  }
}

logoAndTitle() => const Column(
      children: [
        Text(
          'eL',
          style: TextStyle(
              fontSize: 70, color: Colors.purple, fontWeight: FontWeight.bold),
        ),
        Text(
          'No code web-funnel builder with payment and analysis',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.purple),
        ),
      ],
    );

class _AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<_AuthForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextField(
          controller: _emailController,
          hint: 'Email',
        ),
        const SizedBox(height: 16),
        CommonTextField(
          controller: _passwordController,
          hint: 'Password',
          obscureText: true,
          maxLines: 1,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getAuthButton(
              label: 'Login',
              onTap: () => _performAuth(context, isLogin: true),
            ),
            _getAuthButton(
              label: 'Sign Up',
              onTap: () => _performAuth(context, isLogin: false),
            ),
          ],
        ),
      ],
    );
  }

  void _performAuth(BuildContext context, {required bool isLogin}) {
    final authCubit = context.read<AuthCubit>();
    final email = _emailController.text;
    final password = _passwordController.text;

    if (isLogin) {
      authCubit.login(email, password);
    } else {
      authCubit.signUp(email, password);
    }
  }

  _getAuthButton({required String label, required Function() onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 150,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
}
