import '../../../core/base/base_use_case.dart';
import '../../../core/interfaces/i_auth_repository.dart';

class SignInUseCase extends UseCase<void, SignInParams> {
  final IAuthRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<void> call(SignInParams params) {
    return repository.signIn(params.email, params.password);
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
