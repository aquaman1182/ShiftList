import 'package:flutter/material.dart';

class FadeTransitionPage extends MaterialPage {
  final Widget child;

  FadeTransitionPage({
    required this.child,
  }) : super(child: child);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => child,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
