import 'package:flutter/material.dart';
import 'package:shift_app/data_models/user_data/user.dart';
import 'package:shift_app/models/repositories/login_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginRepository loginRepository;

  LoginViewModel({required LoginRepository loginRepository})
      : loginRepository = loginRepository;

  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<String?> login(String email, String password) async {
    startLoading();
    try {
      final user = UserClassData(email: email, name: '', uid: '');
      await loginRepository.login(user, password);
      endLoading();
      return null; // 認証成功時は null を返す
    } catch (e) {
      endLoading();
      return e.toString(); // エラーが発生した場合はエラーメッセージを返す
    }
  }
}
