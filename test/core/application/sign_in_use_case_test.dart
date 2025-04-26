import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_base/core/interfaces/i_auth_repository.dart';
import 'package:flutter_base/features/auth/application/sign_in_use_case.dart';

@GenerateMocks(<Type>[IAuthRepository])
import 'sign_in_use_case_test.mocks.dart';

void main() {
  late SignInUseCase signInUseCase;
  late MockIAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockIAuthRepository();
    signInUseCase = SignInUseCase(mockAuthRepository);
  });

  test('should call signIn with correct parameters', () async {
    const String email = 'test@example.com';
    const String password = 'password123';

    when(mockAuthRepository.signIn(email, password)).thenAnswer((_) async {});

    await signInUseCase(SignInParams(email: email, password: password));

    verify(mockAuthRepository.signIn(email, password)).called(1);
  });
}
