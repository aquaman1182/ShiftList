import 'package:shift_app/data_models/user_data/user.dart';
import 'package:shift_app/models/db/database_manager.dart';

class LoginRepository {
  final DatabaseManager databaseManager;

  LoginRepository({required DatabaseManager databaseManager})
      : databaseManager = databaseManager;

  Future<String?> login(UserClassData user, String password) async {
    return await databaseManager.login(user, password);
  }
}
