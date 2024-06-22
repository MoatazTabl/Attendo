import 'package:attendo/intro/admin/features/home/models/students_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CsGradesScreen extends StatefulWidget {
  const CsGradesScreen({super.key});

  @override
  State<CsGradesScreen> createState() => _CsGradesScreenState();
}

class _CsGradesScreenState extends State<CsGradesScreen> {
  final List<String> grades = ["First", "Second", "Third", "Fourth"];

  late StudentsModel students;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
             Row(
              children: [
                Text(
                  "Select Grade",
                  style: TextStyle(color: Colors.black, fontSize: 30.sp),
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 20,
                ),
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      students = StudentsModel(
                          department: "Computers", grade: grades[index]);
                      context.push("/allStudents", extra: students);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      height: 50,
                      width: 50,
                      child: Center(
                          child: Text(
                        grades[index],
                        style: const TextStyle(fontSize: 25,color: Colors.white),
                      )),
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
