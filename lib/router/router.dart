import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shift_app/views/auth/login_page.dart';
import 'package:shift_app/views/auth/register_page.dart';

GoRouter createGoRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: "/",
        pageBuilder: (context, state) => 
          MaterialPage(
            key: state.pageKey,
            child: LoginPage()
          ), 
      ),
      GoRoute(
        path: "/register",
        pageBuilder: (context, state) => 
          MaterialPage(
            key: state.pageKey,
            child: RegisterPage()
          ),
      )
    ]
  );
}