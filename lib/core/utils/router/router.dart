import 'package:attendo/intro/admin/admin_main_screen.dart';
import 'package:attendo/intro/admin/features/attendance_page/presentation/view/attendance_page_admin.dart';
import 'package:attendo/intro/admin/features/create_lecture/presentation/view/create_lecture_admin.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/sign_in_screen.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/instructor_lecture_details.dart';
import 'package:attendo/intro/student/features/camera/presentation/view/camera.dart';
import 'package:attendo/main_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../intro/auth/sign_up/presentation/view/sign_up_screen.dart';
import '../../../intro/instructor/features/attendance_page/presentation/view/attendance_page_instructor.dart';
import '../../../intro/instructor/instructor_main_screen.dart';
import '../../../intro/student/features/finger_print_scan/presentation/view/finger_print_scan_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    // --------------- Sign In ------------------------
    GoRoute(
      path: "/",
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: "/signUpScreen",
      builder: (context, state) => const SignUpScreen(),
    ),
    //---------------- Student routes------------------
    // GoRoute(
    //   path: "/",
    //   builder: (context, state) => const IntroScreen(),
    // ),
    // GoRoute(
    //   path: "/SignInScreenStudent",
    //   builder: (context, state) => const SignInScreenStudent(),
    // ),

    GoRoute(
      path: "/mainScreen",
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: "/cameraScreen",
      builder: (context, state) => const CameraScreen(),
    ),
    GoRoute(
      path: "/fingerPrintScanScreen",
      builder: (context, state) => const FingerPrintScanScreen(),
    ),
    // GoRoute(
    //   path: "/asd",
    //   builder: (context, state) => const ScanQrScreen(),
    // ),

    //  --------------------instructor routes-----------------
    // GoRoute(
    //   path: "/SignInScreenInstructor",
    //   builder: (context, state) => const SignInInstructorScreen(),
    // ),

    GoRoute(
      path: "/instructorMainScreen",
      builder: (context, state) => const InstructorMainScreen(),
    ),
    GoRoute(
      path: "/instructorLectureDetails",
      builder: (context, state) => const InstructorLectureDetails(),
    ),
    GoRoute(
      path: "/attendancePageInstructor",
      builder: (context, state) => const AttendancePageInstructor(),
    ),

    // -------------------- Admin routes----------------------

    // GoRoute(
    //   path: "/signInScreenAdmin",
    //   builder: (context, state) => const SignInScreenAdmin(),
    // ),
    GoRoute(
      path: "/createLectureAdmin",
      builder: (context, state) => const CreateLectureAdmin(),
    ),
    GoRoute(
      path: "/adminMainScreen",
      builder: (context, state) => const AdminMainScreen(),
    ),
    GoRoute(
      path: "/attendancePageAdmin",
      builder: (context, state) => const AttendancePageAdmin(),
    ),
  ],
);
