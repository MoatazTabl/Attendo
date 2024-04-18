import 'package:attendo/intro/admin/features/auth/sign_in/presentation/view/sign_in_screen_admin.dart';
import 'package:attendo/intro/instructor/features/auth/sign_in/presentation/view/sign_in_instructor_screen.dart';
import 'package:attendo/intro/instructor/features/auth/sign_up/presentation/view/sign_up_instructor_screen.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/instructor_lecture_details.dart';
import 'package:attendo/intro/intro.dart';
import 'package:attendo/intro/student/features/auth/sign_up/presentation/view/sign_up_screen_student.dart';
import 'package:attendo/intro/student/features/camera/presentation/view/camera.dart';
import 'package:attendo/intro/student/features/custom_paint.dart';
import 'package:attendo/main_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../intro/instructor/features/home/presentation/view/home_instructor.dart';


final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: [
    //---------------- Student routes------------------
    GoRoute(
      path: "/",
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: "/SignInScreenStudent",
      builder: (context, state) => const SignInScreenAdmin(),
    ),
   GoRoute(
      path: "/sign_up_student",
      builder: (context, state) => const SignUpScreenStudent(),
    ),

   GoRoute(
      path: "/mainScreen",
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: "/cameraScreen",
      builder: (context, state) => const CameraScreen(),
    ),
  GoRoute(
      path: "/4",
      builder: (context, state) => const customPaint(),
    ),

  //  --------------------instructor routes-----------------
    GoRoute(
      path: "/SignInScreenInstructor",
      builder: (context, state) => const SignInInstructorScreen(),
    ),
    GoRoute(
      path: "/SignUpInstructorScreen",
      builder: (context, state) => const SignUpInstructorScreen(),
    ),
    GoRoute(
      path: "/HomeInstructor",
      builder: (context, state) => const HomeInstructor(),
    ),
    GoRoute(
      path: "/instructorLectureDetails",
      builder: (context, state) => const InstructorLectureDetails(),
    ),


    // -------------------- Admin route----------------------

    GoRoute(
      path: "/signInScreenAdmin",
      builder: (context, state) => const SignInScreenAdmin(),
    ),


  ],
);
