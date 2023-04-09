import 'package:flutter/material.dart';
import 'package:shift_app/models/repositories/login_repository.dart';

class LoginViewModel extends ChangeNotifier{
  final LoginRepository loginRepository;
  LoginViewModel({required LoginRepository loginRepository})
  :loginRepository = loginRepository;
}
