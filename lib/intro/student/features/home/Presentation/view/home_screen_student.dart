import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/widgets/page_indicator.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/student/features/home/Presentation/view/widgets/card_page_view.dart';
import 'package:attendo/intro/student/features/home/logic/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/date_picker_widget.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({super.key, required this.userData});

  final UserDataModel userData;

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.4);

  @override
  void initState() {
    context.read<HomeCubit>().getStudentLectures(data: {
      "faculty": widget.userData.faculty,
      "grade": widget.userData.grade,
      // "date":"2024-04-30T09:18:54"
      "date": DateTime.now().toIso8601String().split(".")[0]
      // "date":"2024-05-05T09:18:54"
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          delegate: DatePiker(userData: widget.userData),
          pinned: true,
        ),
        SliverFillRemaining(
          child: BlocBuilder<HomeCubit, HomeState>(
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CardPageView(
                              pageController: _pageController,
                              lectures: lectures,
                              studentName: widget.userData.name,
                            ),
                          ],
                        ),
                      ),
                      PageIndicator(
                        pageController: _pageController,
                        cardsNumber: lectures.length,
                      ),
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
    return false;
  }
}
