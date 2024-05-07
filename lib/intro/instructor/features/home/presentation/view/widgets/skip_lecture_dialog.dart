import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/instructor/features/home/presentation/data/models/InstructorLecturesModel.dart';
import 'package:attendo/intro/instructor/features/home/presentation/logic/home_instructor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SkipLectureDialog extends StatelessWidget {
  const SkipLectureDialog({
    super.key,
    required this.instructorLecturesModel,
  });

  final InstructorLecturesModel instructorLecturesModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return BlocProvider(
              create: (context) => HomeInstructorCubit(),
              child: BlocConsumer<HomeInstructorCubit, HomeInstructorState>(
                builder: (context, state) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        content:  Text(
                          getAppLocalizations(context)!.areYouSureYouWantToSkipLecture,
                        ),
                        contentTextStyle: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.black),
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        backgroundColor: Colors.white,
                        title:  Center(
                          child: Text(
                            getAppLocalizations(context)!.skipLecture,
                          ),
                        ),
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        elevation: 2,
                        titleTextStyle:
                            Theme.of(context).textTheme.labelSmall?.copyWith(
                                  fontSize: 22.sp,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w700,
                                ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(
                              getAppLocalizations(context)!.cancel,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<HomeInstructorCubit>().skipLecture(
                                  data: {"pk": instructorLecturesModel.pk});
                            },
                            child:  Text(
                              getAppLocalizations(context)!.ok,

                              style: const TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                listener: (BuildContext context, HomeInstructorState state) {
                  state.maybeWhen(
                    orElse: () {},
                    lectureSkipped: () {
                      GlobalSnackBar.show(context, "Lecture Skipped");

                      context.pop(true);
                    },
                  );
                },
              ),
            );
          },
        ).then((value) {
          context.read<HomeInstructorCubit>().getStudentLectures(data: {
            "instructor": instructorLecturesModel.instructorInfo?.name,
            // "date":"2024-04-30T09:18:54"
            "date": DateTime.now().toIso8601String().split(".")[0]
          });
        });
      },
      iconSize: 32,
      icon: const Icon(
        Icons.delete_forever,
        color: Colors.redAccent,
      ),
    );
  }
}