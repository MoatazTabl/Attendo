import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import 'widgets/attendance_item_card.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({super.key});

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  DateTime _selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      scrollDirection: Axis.vertical,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: WeeklyDatePicker(selectedDay: _selectedDate, changeDay: (dateTime ) {
              _selectedDate=dateTime;
              setState(() {
              });
            },
              enableWeeknumberText: false,
              backgroundColor: Colors.transparent,
              daysInWeek: 6,
              weekdays: const ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'],

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
                    controller: PageController(viewportFraction: .4),
                    scrollBehavior: const CupertinoScrollBehavior(),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                  },
                  child: _activePage == index
                      ? Container(
                          height: 54,
                          width: 7,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            color: const Color(0xff182F78),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff9eb9ff),
                                  Color(
                                    0xffccdaff,
                                  ),
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}