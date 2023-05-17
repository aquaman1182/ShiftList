import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shift_app/data_models/user_data/user.dart';
import 'package:shift_app/models/db/database_manager.dart';


class UserRepository {
  final DatabaseManager databaseManager;

  UserRepository({required DatabaseManager databaseManager})
      : databaseManager = databaseManager;

  Future<UserClassData> getUser(String uid) async {
    return await databaseManager.getUser(uid);
  }

  Future<UserClassData?> getCurrentUser() async {
    // ここでは、Firestoreから現在のユーザー情報を取得する例を示します。
    // 実際のコードは、アプリの認証システムやデータベース構造によります。
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      return UserClassData.fromDocument(userDoc);
    } else {
      return null;
    }
  }

Future<Map<String, String>?> signUp(String email, String password, String phoneNumber, String name) async {
  UserClassData user = UserClassData(
    userId: '',  // この部分は適切な値に置き換えてください
    email: email,
    userName: name,
    phoneNumber: phoneNumber,
    profileImageUrl: '',  // この部分も適切な値に置き換えてください
  );
  return await databaseManager.signUp(user, password, phoneNumber);
}

  Future<void> updateUser(UserClassData user) async {
    await databaseManager.updateUser(user);
  }
}