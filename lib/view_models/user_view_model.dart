import 'package:flutter/material.dart';
import 'package:shift_app/data_models/user_data/user.dart';
import '../models/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  UserViewModel({required UserRepository userRepository})
      : _userRepository = userRepository;

  UserClassData? _userProfile;

  UserClassData? get userProfile => _userProfile;

  Future<void> fetchUserProfile(String uid) async {
    _userProfile = await _userRepository.getUser(uid);
    notifyListeners();
  }
}
