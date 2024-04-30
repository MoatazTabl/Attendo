import 'package:attendo/intro/student/features/home/Presentation/view/widgets/attendance_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardPageView extends StatefulWidget {
  const CardPageView({super.key, required this.pageController});
  final PageController pageController;


  @override
  State<CardPageView> createState() => _CardPageViewState();
}

class _CardPageViewState extends State<CardPageView> {
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        controller: widget.pageController,
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
    );
  }
}
