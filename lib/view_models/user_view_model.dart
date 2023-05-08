import 'package:flutter/material.dart';

import '../data_models/user_data/user.dart';
import '../models/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  UserClassData? _user;

  UserClassData? get user => _user;

  final UserRepository userRepository;

  UserViewModel({required this.userRepository});

  Future<void> fetchUserData(String userId) async {
    _user = await userRepository.fetchUserData(userId);
    notifyListeners();
  }
}