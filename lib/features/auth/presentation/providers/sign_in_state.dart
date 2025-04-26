import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final bool isLoading;

  const SignInState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
  });

  SignInState copyWith({String? email, String? password, bool? isLoading}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => <Object?>[email, password, isLoading];
}
