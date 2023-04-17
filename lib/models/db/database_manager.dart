import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signUp(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email, password: password);
      final firebaseUser = userCredential.user;
      if (firebaseUser == null) return "";
    }
    return null;
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final currentUser = FirebaseAuth.instance.currentUser;
      return currentUser?.uid;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}