// lib/features/auth/data/providers/auth_repository_provider.dart
import 'package:flutter_base/core/interfaces/i_auth_repository.dart';
import 'package:flutter_base/features/auth/interfaces/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<IAuthRepository> authRepositoryProvider =
    Provider<IAuthRepository>((Ref<IAuthRepository> ref) {
      return AuthRepository();
    });
