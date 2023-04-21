import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shift_app/views/auth/login_page.dart';
import 'package:shift_app/views/auth/sign_up_screen.dart';
import 'package:shift_app/views/components/bottom_navigation_bar.dart';
import 'package:shift_app/views/master/master_page.dart';
import 'package:shift_app/views/my_profile/my_page.dart';


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
            child: CustomBottomNavigationBar(),
          ),
      ),
      GoRoute(
        path: '/master_page',
        pageBuilder: (BuildContext context, GoRouterState state) => 
          MaterialPage(
            key: state.pageKey, 
            child: MasterPage(),
          ),
      ),
      GoRoute(
        path: '/my_page',
        pageBuilder: (BuildContext context, GoRouterState state) => 
          MaterialPage(
            key: state.pageKey, 
            child: MyProfilePage(),
          ),
      )
    ],
  );
}
