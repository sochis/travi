// lib/features/auth/data/providers/auth_repository_provider.dart
import 'package:travi/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:travi/features/auth/infrastructure/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<IAuthRepository> authRepositoryProvider =
    Provider<IAuthRepository>((Ref<IAuthRepository> ref) {
      return AuthRepository();
    });
