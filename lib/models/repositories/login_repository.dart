import 'package:shift_app/models/db/database_manager.dart';

class AuthService {
  final DatabaseManager databaseManager;

  AuthService({required DatabaseManager databaseManager})
      : databaseManager = databaseManager;

  Future<Map<String, String>?> signUp(String email, String password) async {
    return await databaseManager.signUp(email, password);
  }

  Future<String?> signIn(String user, String password) async {
    return await databaseManager.signIn(user, password);
  }

  Future<void> signOut() async {
    await databaseManager.logout();
  }
}