import '../../domain/repositories/i_auth_repository.dart';
import '../../domain/entities/user.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<User?> getCurrentUser() async {
    // Mocked user for demonstration
    const User user = User(id: '123', email: 'test@example.com');
    return user;
  }

  @override
  Future<void> signIn(String email, String password) async {
    // Simulate network sign-in
    await Future<void>.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> signOut() async {
    // Simulate sign-out
    await Future<void>.delayed(const Duration(milliseconds: 500));
  }
}
