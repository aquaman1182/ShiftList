import 'package:flutter/material.dart';
import 'package:shift_app/data_models/user_data/user.dart';
import '../models/repositories/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _userRepository;

  UserViewModel({required UserRepository userRepository})
      : _userRepository = userRepository;

  UserClassData? _userProfile;

  UserClassData? get userProfile => _userProfile;

Future<void> signUp(String email, String password, String phoneNumber, String name) async {
  final userCredentials = await _userRepository.signUp(email, password, phoneNumber, name);
  if (userCredentials != null) {
    final newUser = UserClassData(
      userId: userCredentials['userId']!,
      userName: '', // Name is not set during sign up
      email: email,
      phoneNumber: phoneNumber,
      profileImageUrl: "",
    );
    await _userRepository.updateUser(newUser, name: '', phoneNumber: '', userId: null);
  } else {
    throw Exception('Registration failed');
  }
}


  Future<void> fetchUserProfile(String uid) async {
    _userProfile = await _userRepository.getUser(uid);
    notifyListeners();
  }
}
