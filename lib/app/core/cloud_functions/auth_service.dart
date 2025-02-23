import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:ttangkkeusmarket/app/core/models/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User();
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final Credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(Credential.user);
  }

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    final Credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(Credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
