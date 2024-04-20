import 'package:flutter/material.dart';

import 'widgets/attendance_item_card.dart';

class HomeScreenStudent extends StatelessWidget {
  const HomeScreenStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AttendanceCard(),
      ],
    );
  }
}

