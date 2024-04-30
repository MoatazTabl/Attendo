import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import 'widgets/attendance_item_card.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({super.key});

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.4);
  int _activePage = 0;
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      scrollDirection: Axis.vertical,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.white,
              selectedTextColor: const Color(0xff71a8ef),

              height: 135.h,
              daysCount: 100,
              deactivatedColor: Colors.white,
              onDateChange: (date) {

                setState(() {
                  _selectedDay = date;
                });
              },
            ),

          )
        ];
      },
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.vertical,
                    controller: _pageController,
                    scrollBehavior: const MaterialScrollBehavior(),
                    itemBuilder: (context, index) {
                      return AttendanceCard(
                        isActive: _activePage == index ? true : false,
                      );
                    },
                    onPageChanged: (value) {
                      HapticFeedback.lightImpact();
                      _activePage = value;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  axisDirection: Axis.vertical,
                  controller: _pageController,
                  count: 10,
                  onDotClicked: (index) {
                    _pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                  effect: const ExpandingDotsEffect(
                    // dotColor: Colors.transparent,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1,
                    dotHeight: 5,
                    dotWidth: 5,
                    spacing: 10,
                    dotColor: Color(
                      0xff182F78,
                    ),
                    expansionFactor: 9,
                    activeDotColor: Color(
                      0xff182F78,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
