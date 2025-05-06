import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_base/features/auth/interfaces/pages/sign_in_page.dart';
import 'package:flutter_base/features/user/interfaces/pages/user_profile_page.dart';
import 'package:flutter_base/features/auth/domain/entities/user.dart';

final GoRouter router = GoRouter(
  initialLocation: '/sign-in',
  routes: <GoRoute>[
    GoRoute(
      path: '/sign-in',
      builder:
          (BuildContext context, GoRouterState state) => const SignInPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        final User user = state.extra as User;
        return UserProfilePage(user: user);
      },
    ),
  ],
);
