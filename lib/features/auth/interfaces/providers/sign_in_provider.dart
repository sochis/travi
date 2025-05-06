import 'package:flutter_base/features/auth/interfaces/controllers/sign_in_controller.dart';
import 'package:flutter_base/features/auth/interfaces/presenters/sign_in_presenter.dart';
import 'package:flutter_base/features/auth/interfaces/providers/sign_in_use_case_provider.dart';
import 'package:flutter_base/features/auth/interfaces/states/sign_in_state.dart';
import 'package:flutter_base/features/auth/usecases/sign_in_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<SignInPresenter, SignInState>
signInPresenterProvider = StateNotifierProvider<SignInPresenter, SignInState>(
  (Ref ref) => SignInPresenter(),
);

final Provider<SignInController> signInControllerProvider =
    Provider<SignInController>((Ref ref) {
      final SignInPresenter presenter = ref.read(
        signInPresenterProvider.notifier,
      );
      final SignInUseCase signInUseCase = ref.read(signInUseCaseProvider);
      return SignInController(
        presenter: presenter,
        signInUseCase: signInUseCase,
        ref: ref,
      );
    });
