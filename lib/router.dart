import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foseja/auth/auth_repo.dart';
import 'package:foseja/main/view/main_tab_screen.dart';
import 'package:foseja/auth/auth_screen.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) {
    ref.watch(authState);
    return GoRouter(
      initialLocation: "/auth",
      redirect: (context, state) {
        final isAuth = ref.watch(authState).value != null;
        return !isAuth ? "/auth" : "/";
      },
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => const MainTabScreen(),
        ),
        GoRoute(
          path: "/auth",
          builder: (context, state) => const AuthScreen(),
        ),
      ],
    );
  },
);
