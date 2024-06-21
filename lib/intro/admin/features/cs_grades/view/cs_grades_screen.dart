import 'package:attendo/intro/admin/features/home/models/students_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CsGradesScreen extends StatelessWidget {
  List<String> grades = ["First", "Second", "Third", "Fourth"];
  late StudentsModel students  ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 50,
                mainAxisSpacing: 30,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    students = StudentsModel(department: "Computers", grade:grades[index] );
                    print(students.grade);
                    print(students.department);
                    context.push("/allStudents",extra: students);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    height: 50,
                    width: 50,
                    child: Center(child: Text(grades[index])),
                  ),
                );
              },
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}
