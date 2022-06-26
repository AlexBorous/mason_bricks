import 'package:{{name}}/auth/provider/auth_provider.dart';
import 'package:{{name}}/auth/state/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthController extends StateNotifier<LoginState> {
  AuthController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await ref.read(authRepositoryProvider).signInWithEmailAndPassword(
            email,
            password,
          );
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

  void signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, LoginState>((ref) {
  return AuthController(ref);
});
