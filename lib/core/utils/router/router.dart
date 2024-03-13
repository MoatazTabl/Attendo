import 'package:attendo/features/Auth/SignIn/Presentation/view/sign_in_screen.dart';
import 'package:attendo/features/Auth/SignUp/Presentation/view/sign_up.dart';
import 'package:attendo/main_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SignInScreen(),
    ),
   GoRoute(
      path: "/sign_up",
      builder: (context, state) => const SignUpScreen(),
    ),

   GoRoute(
      path: "/mainScreen",
      builder: (context, state) => const MainScreen(),
    ),

  ],
);
