import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/attendance_item_card.dart';

class HomeScreenStudent extends StatelessWidget {
  const HomeScreenStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              if (index % 2 == 0) {
                return const AttendanceCard(lottieFile: 'assets/lottie/Animation - 1714116831535.json',);
              } else {
                return const AttendanceCard(lottieFile: 'assets/lottie/Animation - 1714116843265.json',);
              }
            },
          ),
        ),
      ],
    );
  }
}
