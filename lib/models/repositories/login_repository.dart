import 'package:shift_app/models/db/database_manager.dart';

class LoginRepository {
  String? email;
  String? password;
  final DatabaseManager _databaseManager;

  LoginRepository({required DatabaseManager databaseManager})
  :_databaseManager = databaseManager;

  Future<void> login() async{}
}