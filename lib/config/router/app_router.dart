import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_form/screens/login_screen.dart';
import 'package:app_form/screens/dashboard_screen.dart';
import 'package:app_form/services/auth_service.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (BuildContext context, GoRouterState state) {
    final authService = AuthService();
    final isLoggedIn = authService.isLoggedIn();

    if (isLoggedIn) {
      if (state.matchedLocation == '/') {
        return '/dashboard';
      }
    } else {
      if (state.matchedLocation == '/dashboard') {
        return '/';
      }
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
      name: 'login',
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardScreen(),
      name: 'dashboard',
    ),
  ],
);
