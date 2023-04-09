import 'package:flutter/widgets.dart';
import 'package:shift_app/data_models/user_data/user.dart';
import 'package:shift_app/models/db/database_manager.dart';
import 'package:shift_app/models/repositories/register_repository.dart';

class RegisterViewModel extends ChangeNotifier {
  final RegisterRepository registerRepository;
  RegisterViewModel({required RegisterRepository registerRepository})
  :registerRepository = registerRepository;
  
  final DatabaseManager databaseManager = DatabaseManager();

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<String?> signUp(String email, String pass) async {
    startLoading();
    try {
      final user = UserClassData(email: email, name: '', uid: '');
      await registerRepository.signUp(user, pass);
      return null;
    } catch (e) {
      return e.toString();
    } finally {
      endLoading();
    }
  }
}