import 'package:go_router/go_router.dart';

import 'pages/home_page.dart';
import 'pages/calcular_equipaje.dart';
import 'pages/plan_vuelos.dart';
import 'pages/prioridad_embarque.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const AdmissionsHomePage(),
    ),
        GoRoute(
      path: '/equipaje',
      builder: (_, __) => const TuitionPage(),
    ),
            GoRoute(
      path: '/vuelos',
      builder: (_, __) => const InterestPage(),
    ),
                GoRoute(
      path: '/equipaje',
      builder: (_, __) => const BmiPage(),
    ),
  ],
);

