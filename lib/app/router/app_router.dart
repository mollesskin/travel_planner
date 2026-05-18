import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/presentation/login_screen.dart';
import '../../features/trips/presentation/home_screen.dart';
import '../../features/trips/presentation/trip_detail_screen.dart';
import '../../features/places/presentation/search_screen.dart';
import '../../features/collaborative/presentation/collab_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      final isLoginPage = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoginPage) return '/login';
      if (isLoggedIn && isLoginPage) return '/home';

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (ctx, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (ctx, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'trip/:tripId',
            builder: (ctx, state) {
              final tripId = state.pathParameters['tripId']!;
              return TripDetailScreen(tripId: tripId);
            },
            routes: [
              GoRoute(
                path: 'search',
                builder: (ctx, state) => const SearchScreen(),
              ),
              GoRoute(
                path: 'collab',
                builder: (ctx, state) {
                  final tripId = state.pathParameters['tripId']!;
                  return CollabScreen(tripId: tripId);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
});