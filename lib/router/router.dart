import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shift_app/router/router_animation.dart';
import 'package:shift_app/views/auth/login_page.dart';
import 'package:shift_app/views/auth/sign_up_screen.dart';
import 'package:shift_app/views/components/bottom_navigation_bar.dart';
import 'package:shift_app/views/master/master_page.dart';
import 'package:shift_app/views/my_profile/my_page.dart';
import 'package:shift_app/views/shift/shift_add_page.dart';
import 'package:shift_app/views/shift/shift_setting_page.dart';

GoRouter createGoRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) =>
          FadeTransitionPage(
            child: LoginScreen(),
          ),
        routes: [
          GoRoute(
            path: 'signup',
            pageBuilder: (BuildContext context, GoRouterState state) =>
              FadeTransitionPage(
                child: SignUpScreen(),
              ),
          ),
        ],
      ),
      GoRoute(
          path: '/shift_page',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              MaterialPage(
                key: state.pageKey,
                child: CustomBottomNavigationBar(),
              ),
          routes: [
            GoRoute(
              path: 'add',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  FadeTransitionPage(
                child: ShiftAddPage(),
              ),
              routes: [
                GoRoute(
                  path: 'setting',
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    final selectedDays = 
                      (state.extra as Map<String, dynamic>?)?['selectedDays'] as Set<DateTime>? ?? Set<DateTime>();
                    return MaterialPage(
                      key: state.pageKey,
                      child: ShiftSettingPage(selectedDays: selectedDays),
                    );
                  },
                ),
              ]
            ),
          ]),
      GoRoute(
        path: '/master_page',
        pageBuilder: (BuildContext context, GoRouterState state) =>
          FadeTransitionPage(
            child: MasterPage(),
          ),
      ),
      GoRoute(
        path: '/my_page',
        pageBuilder: (BuildContext context, GoRouterState state) =>
          FadeTransitionPage(
            child: MyProfilePage(),
          ),
      ),
    ],
  );
}
