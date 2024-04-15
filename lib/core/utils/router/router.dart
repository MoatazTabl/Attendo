import 'package:attendo/features/auth/sign_in/presentation/view/sign_in_screen.dart';
import 'package:attendo/features/auth/sign_up/presentation/view/sign_up_screen.dart';
import 'package:attendo/features/camera/presentation/view/camera.dart';
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
    GoRoute(
      path: "/cameraScreen",
      builder: (context, state) => const CameraScreen(),
    ),
  ],
);
