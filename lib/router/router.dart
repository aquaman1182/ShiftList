import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shift_app/views/auth/login_page.dart';
import 'package:shift_app/views/auth/register_page.dart';
import 'package:shift_app/views/shift/shift_list_page.dart';

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
      ),
      GoRoute(
        path: "/shift_list",
        pageBuilder: (context, state) => 
          MaterialPage(
            key: state.pageKey,
            child: ShiftPage()
          ),
      )
    ]
  );
}