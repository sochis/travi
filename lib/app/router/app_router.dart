import 'package:flutter/material.dart';
import 'package:flutter_base/features/map/presentation/pages/map_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_base/features/auth/presentation/pages/sign_in_page.dart';

final GoRouter router = GoRouter(
  // initialLocation: '/sign-in',
  initialLocation: '/map',
  routes: <GoRoute>[
    GoRoute(
      path: '/sign-in',
      builder:
          (BuildContext context, GoRouterState state) => const SignInPage(),
    ),
    GoRoute(
      path: '/map',
      builder: (BuildContext context, GoRouterState state) => const MapPage(),
    ),
  ],
);
