import 'package:shift_app/data_models/user_data/user.dart';
import 'package:shift_app/models/db/database_manager.dart';


class UserRepository {
  final DatabaseManager databaseManager;

  UserRepository({required DatabaseManager databaseManager})
      : databaseManager = databaseManager;

  Future<UserClassData> getUser(String uid) async {
    return await databaseManager.getUser(uid);
  }

  Future<Map<String, String>?> signUp(String email, String password, String phoneNumber, String name) async {
    return await databaseManager.signUp(email, password, phoneNumber, name);
  }



  Future<void> updateUser(UserClassData user, {required userId, required String name, required String phoneNumber}) async {
    await databaseManager.updateUser(user);
  }
}