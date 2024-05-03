import 'package:attendo/core/router/app_routes.dart';
import 'package:attendo/intro/admin/admin_main_screen.dart';
import 'package:attendo/intro/admin/features/attendance_page/presentation/view/attendance_page_admin.dart';
import 'package:attendo/intro/admin/features/create_lecture/presentation/view/create_lecture_admin.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/sign_in_screen.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/instructor_lecture_details.dart';
import 'package:attendo/intro/student/features/camera/presentation/view/camera.dart';
import 'package:attendo/intro/student/features/home/logic/home_cubit.dart';
import 'package:attendo/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../intro/auth/sign_up/presentation/view/sign_up_screen.dart';
import '../../../intro/instructor/features/attendance_page/presentation/view/attendance_page_instructor.dart';
import '../../../intro/instructor/instructor_main_screen.dart';
import '../../../intro/student/features/finger_print_scan/presentation/view/finger_print_scan_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.signInScreen,
  routes: [
    // --------------- Sign In ------------------------
    GoRoute(
      path: AppRoutes.signInScreen,
      builder: (context, state) =>
          const SignInScreen(),
    ),
    GoRoute(
      path: AppRoutes.signUpScreen,
      builder: (context, state) =>
          const SignUpScreen(),
    ),

    //---------------- Student routes------------------
    GoRoute(
      path: AppRoutes.mainScreen,
      builder: (context, state) =>
          MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => HomeCubit(),
            ),

          ], child: const MainScreen()),
    ),
    GoRoute(
      path: AppRoutes.cameraScreen,
      builder: (context, state) => const CameraScreen(),
    ),
    GoRoute(
      path: AppRoutes.fingerPrintScanScreen,
      builder: (context, state) => const FingerPrintScanScreen(),
    ),

    // ------------------ instructorScreen ----------------------

    GoRoute(
      path: AppRoutes.instructorMainScreen,
      builder: (context, state) => const InstructorMainScreen(),
    ),
    GoRoute(
      path: AppRoutes.instructorLectureDetails,
      builder: (context, state) => const InstructorLectureDetails(),
    ),
    GoRoute(
      path: AppRoutes.attendancePageInstructor,
      builder: (context, state) => const AttendancePageInstructor(),
    ),

    // -------------------- Admin routes----------------------


    GoRoute(
      path: AppRoutes.createLectureAdmin,
      builder: (context, state) => const CreateLectureAdmin(),
    ),
    GoRoute(
      path: AppRoutes.adminMainScreen,
      builder: (context, state) => const AdminMainScreen(),
    ),
    GoRoute(
      path: AppRoutes.attendancePageAdmin,
      builder: (context, state) => const AttendancePageAdmin(),
    ),
  ],
);
