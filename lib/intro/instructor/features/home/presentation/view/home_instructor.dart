import 'package:attendo/core/app_images.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/instructor/features/home/presentation/logic/home_instructor_cubit.dart';
import 'package:attendo/intro/instructor/features/home/presentation/view/widgets/instructor_lecture_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeInstructor extends StatefulWidget {
  const HomeInstructor({super.key, required this.userData});

  final UserDataModel userData;

  @override
  State<HomeInstructor> createState() => _HomeInstructorState();
}

class _HomeInstructorState extends State<HomeInstructor> {
  @override
  void initState() {
    context.read<HomeInstructorCubit>().getStudentLectures(data: {
      "instructor": widget.userData.name,
      // "date":"2024-04-30T09:18:54"
      "date": DateTime.now().toIso8601String().split(".")[0]
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: UniqueKey(),
      padding: EdgeInsets.only(
        left: 16.sp,
        right: 16.sp,
        top: 70.sp,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lectures",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 30.sp,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          BlocConsumer<HomeInstructorCubit, HomeInstructorState>(
              listener: (context, state) {
            if (state == HomeInstructorState.lectureSkipped()) {
              context.read<HomeInstructorCubit>().getStudentLectures(data: {
                "instructor": widget.userData.name,
                // "date":"2024-04-30T09:18:54"
                "date": DateTime.now().toIso8601String().split(".")[0]
              });
            }
          }, builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                print("erorr");
                return const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.redAccent,
                  ),
                );
              },
              dataFetching: () => const Center(
                child: CircularProgressIndicator(
                  color: Color(
                    0xff182F78,
                  ),
                ),
              ),
              dataError: (error) => Center(
                child: Text(error),
              ),
              lecturesAvailable: (lectures) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InstructorLectureCard(
                          instructorLecturesModel: lectures[index],
                        ),
                      );
                    },
                    itemCount: lectures.length,
                  ),
                );
              },
              lecturesNotAvailable: () => Center(
                child: SvgPicture.asset(
                  AppImages.noAvailableLectures,
                  width: 350.w,
                  height: 340.h,
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
