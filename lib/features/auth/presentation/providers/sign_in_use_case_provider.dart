import 'package:flutter_base/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:flutter_base/features/auth/presentation/presenters/auth_repository_provider.dart';
import 'package:flutter_base/features/auth/application/usecases/sign_in_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<SignInUseCase> signInUseCaseProvider = Provider<SignInUseCase>((
  Ref<SignInUseCase> ref,
) {
  final IAuthRepository repository = ref.read(authRepositoryProvider);
  return SignInUseCase(repository);
});
