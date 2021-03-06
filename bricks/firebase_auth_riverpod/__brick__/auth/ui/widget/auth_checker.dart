import 'package:{{name}}/auth/provider/auth_provider.dart';
import 'package:{{name}}/auth/ui/screen/home_screen.dart';
import 'package:{{name}}/auth/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
        data: (user) {
          if (user != null) return const HomeScreen();
          return const LoginScreen();
        },
        loading: () => const SplashScreen(),
        error: (e, trace) => const LoginScreen());
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
