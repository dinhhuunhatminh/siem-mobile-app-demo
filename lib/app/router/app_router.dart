import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/auth/auth_controller.dart';
import '../../core/auth/auth_state.dart';
import '../../features/alerts/presentation/screens/alerts_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/dashboards/presentation/screens/dashboards_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/reports/presentation/screens/reports_screen.dart';
import '../../shared/widgets/bottom_navbar/app_bottom_navbar_scaffold.dart';
import 'route_names.dart';

part 'app_router.g.dart';

/// GoRouter cần biết "khi nào state đổi để tự đánh giá lại redirect" qua
/// một Listenable riêng — nếu để cả GoRouter được tạo lại mỗi khi AuthState
/// đổi (bằng cách ref.watch ngay trong provider), router mất lịch sử
/// điều hướng và redirect ban đầu không kịp áp dụng.
class _AuthRefreshNotifier extends ChangeNotifier {
  _AuthRefreshNotifier(Ref ref) {
    ref.listen(authControllerProvider, (previous, next) => notifyListeners());
  }
}

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final refreshNotifier = _AuthRefreshNotifier(ref);
  ref.onDispose(refreshNotifier.dispose);

  return GoRouter(
    initialLocation: RouteNames.home,
    refreshListenable: refreshNotifier,
    routes: [
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      // 4 tab chính, mỗi tab 1 "branch" giữ state riêng khi chuyển qua lại
      // (không bị build lại từ đầu mỗi lần đổi tab).
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppBottomNavbarScaffold(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.alerts,
                builder: (context, state) => const AlertsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.dashboards,
                builder: (context, state) => const DashboardsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteNames.reports,
                builder: (context, state) => const ReportsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      final isLoginRoute = state.matchedLocation == RouteNames.login;

      switch (authState) {
        case AuthInitial():
          return null;
        case AuthUnauthenticated():
          return isLoginRoute ? null : RouteNames.login;
        case AuthAuthenticated():
          return isLoginRoute ? RouteNames.home : null;
      }
    },
  );
}
