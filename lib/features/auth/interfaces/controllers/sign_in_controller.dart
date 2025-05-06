import 'package:flutter/material.dart';
import 'package:flutter_base/features/auth/domain/entities/user.dart';
import 'package:flutter_base/features/auth/interfaces/presenters/sign_in_presenter.dart';
import 'package:flutter_base/features/auth/usecases/sign_in_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInController {
  final SignInPresenter presenter;
  final SignInUseCase signInUseCase;
  final Ref ref;

  SignInController({
    required this.presenter,
    required this.signInUseCase,
    required this.ref,
  });

  Future<void> signIn(BuildContext context) async {
    presenter.setLoading(true);

    try {
      await signInUseCase(
        SignInParams(
          email: presenter.currentState.email,
          password: presenter.currentState.password,
        ),
      );

      if (!context.mounted) return;

      context.go(
        '/profile',
        extra: User(id: '123', email: presenter.currentState.email),
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Sign in failed: $e')));
      }
    } finally {
      if (context.mounted) {
        presenter.setLoading(false);
      }
    }
  }
}
