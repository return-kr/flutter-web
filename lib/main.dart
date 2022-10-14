// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_flutter/api_call_screen.dart';
import 'package:pdp_flutter/cart.screen.dart';
import 'package:pdp_flutter/home_screen.dart';
import 'package:pdp_flutter/main_screen.dart';
import 'package:pdp_flutter/pdp_screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            path: 'api',
            builder: (BuildContext context, GoRouterState state) =>
            const ApiCallScreen(),
          ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const MainScreen(),
      ),
    ],

  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
