import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/auth_repository_impl.dart';

final authLoadingProvider = StateProvider<bool>((ref) => false);

final authErrorProvider = StateProvider<String?>((ref) => null);

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(ref);
});

class AuthController {
  final Ref ref;

  AuthController(this.ref);

  Future<void> login(String email, String password) async {
    ref.read(authLoadingProvider.notifier).state = true;
    ref.read(authErrorProvider.notifier).state = null;

    try {
      await ref.read(authRepositoryProvider).login(email, password);
    } catch (e) {
      ref.read(authErrorProvider.notifier).state = _formatAuthError(e);
    } finally {
      ref.read(authLoadingProvider.notifier).state = false;
    }
  }

  Future<void> register(String email, String password) async {
    ref.read(authLoadingProvider.notifier).state = true;
    ref.read(authErrorProvider.notifier).state = null;

    try {
      await ref.read(authRepositoryProvider).register(email, password);
    } catch (e) {
      ref.read(authErrorProvider.notifier).state = _formatAuthError(e);
    } finally {
      ref.read(authLoadingProvider.notifier).state = false;
    }
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).logout();
  }

  String _formatAuthError(Object error) {
    final message = error.toString();

    if (message.contains('invalid-email')) {
      return 'Invalid email format.';
    }

    if (message.contains('user-not-found')) {
      return 'User not found.';
    }

    if (message.contains('wrong-password')) {
      return 'Incorrect password.';
    }

    if (message.contains('invalid-credential')) {
      return 'Invalid email or password.';
    }

    if (message.contains('email-already-in-use')) {
      return 'This email is already registered.';
    }

    if (message.contains('weak-password')) {
      return 'Password is too weak.';
    }

    return 'Authentication failed. Please try again.';
  }
}