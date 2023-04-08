import 'package:flutter/widgets.dart';
import 'package:shift_app/models/db/database_manager.dart';

class RegisterViewModel extends ChangeNotifier {
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

  Future<bool> signIn(String email, String password) async {
    startLoading();
    final userCredential = await databaseManager.signInWithEmailAndPassword(
        email, password);
    if (userCredential != null) {
      return true;
    } else {
      return false;
    }
  }
}