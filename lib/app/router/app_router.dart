import 'package:flutter/material.dart';
import 'package:flutter_base/features/map/presentation/pages/map_page.dart';
import 'package:flutter_base/features/map/presentation/pages/test_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/map',
  // initialLocation: '/test',
  routes: <GoRoute>[
    GoRoute(
      path: '/map',
      builder: (BuildContext context, GoRouterState state) => MapPage(),
    ),
    GoRoute(
      path: '/test',
      builder: (BuildContext context, GoRouterState state) => const TestPage(),
    ),
  ],
);
