import 'package:attendo/core/router/app_routes.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/sign_in_screen.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/cubits/get_report_cubit.dart';
import 'package:attendo/intro/instructor/features/create_lecture/logic/create_lecture_cubit.dart';
import 'package:attendo/intro/instructor/features/create_lecture/presentation/view/create_lecture_instructor.dart';
import 'package:attendo/intro/instructor/features/edit_lecture/logic/edit_lecture_cubit.dart';
import 'package:attendo/intro/instructor/features/edit_lecture/presentation/view/edit_lecture_instructor.dart';
import 'package:attendo/intro/instructor/features/home/data/models/instructor_lectures_model.dart';
import 'package:attendo/intro/instructor/features/home/logic/home_instructor_cubit.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/instructor_lecture_details.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view_model/cubits/generate_qr/generate_qr_cubit.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view_model/cubits/start_report/start_report_cubit.dart';
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
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: AppRoutes.signUpScreen,
      builder: (context, state) => const SignUpScreen(),
    ),

    //---------------- Student routes------------------
    GoRoute(
      path: AppRoutes.mainScreen,
      builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
          ],
          child: MainScreen(
            userData: state.extra as UserDataModel,
          )),
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
      builder: (context, state) => BlocProvider(
        create: (context) => HomeInstructorCubit(),
        child: InstructorMainScreen(
          userData: state.extra as UserDataModel,
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.instructorLectureDetails,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GenerateQrCubit(),
          ),
          BlocProvider(
            create: (context) => StartReportCubit(),
          ),
        ],
        child: InstructorLectureDetails(
          instructorLecturesModel: state.extra as InstructorLecturesModel,
        ),
      ),
    ),
    GoRoute(
      path: AppRoutes.attendancePageInstructor,
      builder: (context, state) => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => GetReportCubit(),
        ),
      ], child: AttendancePageInstructor(lecturePk: state.extra as int,), ),
    ),
    GoRoute(
      path: AppRoutes.createLectureInstructor,
      builder: (context, state) => BlocProvider(
        create: (context) => CreateLectureCubit(),
        child: CreateLectureInstructor(
          userDataModel: state.extra as UserDataModel,
        ),
      ),
    ),

    GoRoute(
      path: AppRoutes.editLectureInstructor,
      builder: (context, state) => BlocProvider(
        create: (context) => EditLectureCubit(),
        child: EditLectureInstructor(
          instructorLecturesModel: state.extra as InstructorLecturesModel,
        ),
      ),
    ),
  ],
);
