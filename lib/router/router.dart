import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shift_app/views/auth/login_page.dart';
import 'package:shift_app/views/auth/sign_up_screen.dart';
import 'package:shift_app/views/shift/shift_list_page.dart';


GoRouter createGoRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage(
          key: state.pageKey,
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/signup',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage(
          key: state.pageKey,
          child: SignUpScreen(),
        ),
      ),
      GoRoute(
        path: '/shift_page',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage(
          key: state.pageKey,
          child: ShiftPage(),
        ),
      ),
    ],
  );
}
