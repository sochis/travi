import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/auth_repository.dart';
import '../../../../core/interfaces/i_auth_repository.dart';

// Define a provider for the authentication repository
final Provider<IAuthRepository> authRepositoryProvider =
    Provider<IAuthRepository>((Ref ref) {
      return AuthRepository();
    });
