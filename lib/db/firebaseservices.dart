import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth;

  FirebaseService(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<String> logIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Logged In";
    } catch (e) {
      return "e";
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "Signed Up";
    } catch (e) {
      return "e";
    }
  }
}
