import 'package:attendo/intro/admin/features/home/models/students_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllStudentsScreen extends StatelessWidget {


 final StudentsModel studentsModel ;


  const AllStudentsScreen({super.key, required this.studentsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 50,
            mainAxisSpacing: 30,
          ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20)),
              height: 50,
              width: 50,
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
