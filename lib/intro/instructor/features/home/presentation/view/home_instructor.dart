import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/widgets/page_indicator.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/instructor/features/home/logic/home_instructor_cubit.dart';
import 'package:attendo/intro/instructor/features/home/presentation/view/widgets/instructor_lecture_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/date_picker_widget.dart';

class HomeInstructor extends StatefulWidget {
  const HomeInstructor({super.key, required this.userData});

  final UserDataModel userData;

  @override
  State<HomeInstructor> createState() => _HomeInstructorState();
}

class _HomeInstructorState extends State<HomeInstructor> {
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.5,
  );

  @override
  void initState() {
    context.read<HomeInstructorCubit>().getInstructorLectures(data: {
      "instructor": widget.userData.name,
      // "date":"2024-04-30T09:18:54"
      "date": DateTime.now().toIso8601String().split(".")[0]
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30.h,
          ),
        ),
        SliverPersistentHeader(
          delegate: DatePiker(userData: widget.userData),
          pinned: true,
          floating: false,
        ),
        SliverFillRemaining(
          child: BlocBuilder<HomeInstructorCubit, HomeInstructorState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
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
                  return Row(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          scrollDirection: Axis.vertical,
                          itemCount: lectures.length,
                          itemBuilder: (context, index) {
                            return InstructorLectureCard(
                                instructorLecturesModel: lectures[index]);
                          },
                        ),
                      ),
                      PageIndicator(
                          pageController: _pageController,
                          cardsNumber: lectures.length),
                    ],
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
            },
          ),
        ),
      ],
    );
  }
}

class DatePiker extends SliverPersistentHeaderDelegate {
  DatePiker({required this.userData});

  final UserDataModel userData;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return DatePickerWidget(
      userData: userData,
    );
  }

  @override
  double get maxExtent => 110.h;

  @override
  double get minExtent => 110.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
