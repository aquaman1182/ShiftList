import 'package:shift_app/data_models/user_data/user.dart';
import 'package:shift_app/models/db/database_manager.dart';

class RegisterRepository {
  String? email;
  String? password;
  final DatabaseManager _databaseManager;

  RegisterRepository({required DatabaseManager databaseManager})
      : _databaseManager = databaseManager;

  Future<void> signUp(UserClassData user, String password) async {
    await _databaseManager.signUp(user, password);
  }

  void setEmail(String email) {
    this.email;
  }

  void setPassword(String password) {
    this.password;
  }
}