import 'package:shift_app/data_models/user_data/user.dart';
import 'package:shift_app/models/db/database_manager.dart';

class AuthService {
  final DatabaseManager databaseManager;

  AuthService({required DatabaseManager databaseManager})
      : databaseManager = databaseManager;

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



  Future<String?> signIn(String user, String password) async {
    return await databaseManager.signIn(user, password);
  }

  Future<void> signOut() async {
    await databaseManager.logout();
  }
}