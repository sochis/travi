import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../states/sign_in_state.dart';

class SignInPresenter extends StateNotifier<SignInState> {
  SignInPresenter() : super(const SignInState());

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  SignInState get currentState => state;
}
