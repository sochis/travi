import '../../features/auth/domain/user.dart';

abstract class IAuthRepository {
  Future<User?> getCurrentUser();
  Future<void> signIn(String email, String password);
  Future<void> signOut();
}
