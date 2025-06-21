import 'package:flutter/material.dart';
import 'package:travi/features/map/presentation/pages/map_page.dart';
import 'package:travi/features/map/presentation/pages/test_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/map',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: Container(
            height: 60,
            color: Colors.blueGrey,
            alignment: Alignment.center,
            child: const Text('共通フッター', style: TextStyle(color: Colors.white)),
          ),
        );
      },
      routes: <GoRoute>[
        GoRoute(
          path: '/map',
          builder: (BuildContext context, GoRouterState state) => MapPage(),
        ),
        GoRoute(
          path: '/test',
          builder: (BuildContext context, GoRouterState state) =>
              const TestPage(),
        ),
      ],
    ),
  ],
);
