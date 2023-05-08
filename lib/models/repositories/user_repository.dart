import 'package:shift_app/data_models/user_data/user.dart';
import 'package:shift_app/models/db/database_manager.dart';


class UserRepository {
  final DatabaseManager _databaseManager;

  UserRepository({required DatabaseManager databaseManager})
      : _databaseManager = databaseManager;

  Future<UserClassData> getUser(String uid) async {
    return await _databaseManager.getUser(uid);
  }

  Future<void> updateUser(UserClassData user, {required userId, required String name, required String phoneNumber}) async {
    await _databaseManager.updateUser(user);
  }
}