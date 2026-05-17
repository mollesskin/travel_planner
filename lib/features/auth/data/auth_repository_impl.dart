import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(FirebaseAuth.instance);
});
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;
  AuthRepositoryImpl(this._auth);

  @override
  Future<void> login(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email.trim(), password: password);
  }

  @override
  Future<void> register(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email.trim(), password: password);
  }

  @override
  Future<void> logout() => _auth.signOut();

  @override
  String? get currentUserId => _auth.currentUser?.uid;
}
