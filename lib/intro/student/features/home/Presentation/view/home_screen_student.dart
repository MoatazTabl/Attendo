import 'package:attendo/intro/student/features/home/Presentation/view/widgets/card_page_view.dart';
import 'package:attendo/intro/student/features/home/Presentation/view/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

import 'widgets/date_picker_widget.dart';

class HomeScreenStudent extends StatefulWidget {
  const HomeScreenStudent({super.key});

  @override
  State<HomeScreenStudent> createState() => _HomeScreenStudentState();
}

class _HomeScreenStudentState extends State<HomeScreenStudent> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.4);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      scrollDirection: Axis.vertical,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const SliverToBoxAdapter(
            child: DatePickerWidget(),
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
                CardPageView(pageController: _pageController,),
              ],
            ),
          ),
          PageIndicator(pageController: _pageController),
        ],
      ),
    );
  }
}
