import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shift_app/data_models/user_data/user.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> signUp(UserClassData user, String password) async {
    if (user.email.isNotEmpty && password.isNotEmpty) {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email, password: password);
      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final doc = _db.collection('users').doc(user.uid);
        await doc.set(user.toJson());
      }
    }
  }

    Future<String?> login(UserClassData user, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: user.email, password: password);
      final currentUser = _auth.currentUser;
      return currentUser?.uid;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
}