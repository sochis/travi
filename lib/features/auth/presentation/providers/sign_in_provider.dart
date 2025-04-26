import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'sign_in_state.dart';

final StateNotifierProvider<SignInController, SignInState> signInProvider =
    StateNotifierProvider<SignInController, SignInState>((Ref ref) {
      return SignInController();
    });

class SignInController extends StateNotifier<SignInState> {
  SignInController() : super(const SignInState());

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<void> signIn(BuildContext context) async {
    state = state.copyWith(isLoading: true);

    try {
      await Future<void>.delayed(const Duration(seconds: 1));

      if (!context.mounted) return;

      Navigator.of(context).pushReplacementNamed('/profile');
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Sign in failed: $e')));
      }
    } finally {
      if (context.mounted) {
        state = state.copyWith(isLoading: false);
      }
    }
  }
}
