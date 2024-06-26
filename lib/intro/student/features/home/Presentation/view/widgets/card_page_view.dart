import 'package:attendo/intro/student/features/home/data/models/students_lectures_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'attendance_item_card.dart';

class CardPageView extends StatefulWidget {
  const CardPageView(
      {super.key,
      required this.pageController,
      required this.lectures,
      required this.studentName});

  final PageController pageController;
  final List<StudentsLecturesModel> lectures;
  final String studentName;

  @override
  State<CardPageView> createState() => _CardPageViewState();
}

class _CardPageViewState extends State<CardPageView> {
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: widget.lectures.length,
        scrollDirection: Axis.vertical,
        controller: widget.pageController,
        scrollBehavior: const MaterialScrollBehavior(),
        itemBuilder: (context, index) {
          return AttendanceCard(
            isActive: _activePage == index ? true : false,
            lectures: widget.lectures[index],
            studentName: widget.studentName,
          );
        },
        onPageChanged: (value) {
          HapticFeedback.lightImpact();
          _activePage = value;
          setState(() {});
        },
      ),
    );
  }
}
