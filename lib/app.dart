import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/home/home_screen.dart';
import 'screens/sessions/session_detail_screen.dart';
import 'screens/rounds/round_detail_screen.dart';
import 'screens/settings/settings_screen.dart';

class QuiverApp extends StatelessWidget {
  const QuiverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Quiver',
      debugShowCheckedModeBanner: false,
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: ThemeMode.system,
      routerConfig: _router,
    );
  }

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/session/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return SessionDetailScreen(sessionId: id);
        },
      ),
      GoRoute(
        path: '/session/:sessionId/round/:roundId',
        builder: (context, state) {
          final sessionId = state.pathParameters['sessionId']!;
          final roundId = state.pathParameters['roundId']!;
          return RoundDetailScreen(
            sessionId: sessionId,
            roundId: roundId,
          );
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2E7D32), // Archery green
        brightness: Brightness.light,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 4,
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF2E7D32), // Archery green
        brightness: Brightness.dark,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 4,
      ),
    );
  }
}
