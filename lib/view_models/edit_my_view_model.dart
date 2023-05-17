import 'package:flutter/material.dart';
import 'package:shift_app/data_models/user_data/user.dart';
import 'package:shift_app/models/repositories/user_repository.dart';

class EditProfileViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  UserClassData? currentUser;

  EditProfileViewModel({required this.userRepository});

  Future<void> initUser() async {
    this.currentUser = await userRepository.getCurrentUser();
  }

  Future<bool> updateProfile(String newName) async {
    if (currentUser != null) {
      UserClassData updatedUser = currentUser!.copyWith(userName: newName);
      await userRepository.updateUser(updatedUser);
      currentUser = updatedUser;
      notifyListeners();
      return true;
    }
    return false;
  }
}
