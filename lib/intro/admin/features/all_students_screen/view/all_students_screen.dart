import 'package:attendo/intro/admin/features/all_students_screen/view_model/cubit/get_all_students_cubit.dart';
import 'package:attendo/intro/admin/features/home/models/students_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllStudentsScreen extends StatefulWidget {
  final StudentsModel studentsModel;

  const AllStudentsScreen({super.key, required this.studentsModel});

  @override
  State<AllStudentsScreen> createState() => _AllStudentsScreenState();
}

class _AllStudentsScreenState extends State<AllStudentsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetAllStudentsCubit>().getAllStudents(
        widget.studentsModel.department, widget.studentsModel.grade);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetAllStudentsCubit, GetAllStudentsState>(
          builder: (context, state) {
            if (state is GetAllStudentsSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 30,
                    mainAxisExtent: 150,
                  ),
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8E8E8),
                          borderRadius: BorderRadius.circular(20)),
                      height: 50,
                      width: 50,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 9.h,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(state.students[index].photo??""),
                            radius: 40,
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Text(state.students[index].name!),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(state.students[index].nationalId!),
                        ],
                      ),
                    );
                  },
                  itemCount: state.students.length,
                ),
              );
            } else if (state is GetAllStudentsFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
