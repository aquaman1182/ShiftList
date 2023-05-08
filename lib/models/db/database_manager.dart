import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data_models/user_data/user.dart';

class DatabaseManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<Map<String, String>?> signUp(String email, String password) async {

    if (email.isNotEmpty && password.isNotEmpty) {
      final userCredential = await _auth
          .createUserWithEmailAndPassword(
              email: email, password: password);
      final firebaseUser = userCredential.user;
      if (firebaseUser == null) return null;

      // Userクラスのインスタンスを作成
      UserClassData newUser = UserClassData(
        userId: firebaseUser.uid,
        email: firebaseUser.email!,
        userName: '', // これらの情報は後でユーザーに入力してもらうか、デフォルト値を設定できます
        phoneNumber: '',
        profileImageUrl: '',
      );

      // 新規登録後にユーザー情報をデータベースに保存する処理
      await saveUserToDatabase(newUser);

      return {'userId': firebaseUser.uid, 'email': firebaseUser.email!};
    }
    return null;
  }

    Future<void> saveUserToDatabase(UserClassData user) async {
    // データベースにユーザー情報を保存する処理を実装してください
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

  Future<void> logout() async {
    await _auth.signOut();
  }
    Future<UserClassData> getUser(String uid) async {
    final docSnapshot = await _firestore.collection('users').doc(uid).get();
    if (docSnapshot.exists) {
      return UserClassData.fromDocument(docSnapshot);
    } else {
      throw Exception("User not found");
    }
  }

  Future<void> updateUser(UserClassData user) async {
    await _firestore.collection('users').doc(user.userId).update(user.toJson());
  }
}