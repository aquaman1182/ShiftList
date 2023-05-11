import 'package:flutter/material.dart';
import 'package:shift_app/models/repositories/login_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService;

  AuthViewModel({required AuthService authService})
      : _authService = authService;

  bool isLoading = false;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _obscureText = true;

  bool get obscureText => _obscureText;

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }


  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<String?> signIn(String email, String password) async {
    startLoading();
    try {
      await _authService.signIn(email, password);
      setErrorMessage(null); // ログイン成功時、エラーメッセージを消去
      endLoading();
      return null; // 認証成功時は null を返す
    } catch (e) {
      endLoading();
      return e.toString(); // エラーが発生した場合はエラーメッセージを返す
    }
  }


  Future<String?> signUp(String email, String pass, String phone, String name) async {
    startLoading();
    try {
      final userInfo = await _authService.signUp(email, pass, phone, name);

      if (userInfo != null) {
        return null; // エラーがなければnullを返す
      } else {
        return "登録に失敗しました。";
      }
    } catch (e) {
      return e.toString();
    } finally {
      endLoading();
    }
  }


}