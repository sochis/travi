import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/repositories/auth_repository.dart';
import '../../domain/repositories/i_auth_repository.dart';

// Define a provider for the authentication repository
final Provider<IAuthRepository> authRepositoryProvider =
    Provider<IAuthRepository>((Ref ref) {
      return AuthRepository();
    });
