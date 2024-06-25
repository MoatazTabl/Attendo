import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/cubits/get_report_cubit.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/instructor_details_report_model.dart';
import 'package:attendo/intro/instructor/features/create_lecture/presentation/view/widgets/create_lecture_text_field.dart';
import 'package:attendo/intro/student/features/scan_qr/logic/qr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ManualAppendStudent extends StatefulWidget {
  const ManualAppendStudent(
      {super.key,
      required this.lecturePk,
      required this.instructorDetailsReportModel});

  final int lecturePk;
  final InstructorDetailsReportModel instructorDetailsReportModel;

  @override
  State<ManualAppendStudent> createState() => _ManualAppendStudentState();
}

class _ManualAppendStudentState extends State<ManualAppendStudent> {
  TextEditingController studentName = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    studentName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: true,
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (context) => QrCubit(),
                child: Form(
                  key: formKey,
                  child: Dialog(
                    child: SizedBox(
                      height: 250.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            getAppLocalizations(context)!.addStudent,
                            style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                            ),
                          ),
                          CreateLecturesTextField(
                            hintText: getAppLocalizations(context)!.name,
                            textEditingController: studentName,
                            enabled: true,
                            validator: validator,
                          ),
                          // Spacer(),
                          BlocProvider(
                            create: (context1) => QrCubit(),
                            child: BlocBuilder<QrCubit, QrState>(
                              builder: (context1, state) {
                                return ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        context1.read<QrCubit>().appendStudent(
                                            widget.lecturePk, studentName.text);
                                        context1.pop();
                                      }
                                    },
                                    style: ButtonStyle(
                                      fixedSize: WidgetStateProperty.all(
                                        Size(
                                          178.w,
                                          38.h,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                        getAppLocalizations(context)!.add));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).then(
          (value) {
            context.read<GetReportCubit>().getReport(
                widget.instructorDetailsReportModel.instructorLecturesModel.pk!,
                widget.instructorDetailsReportModel.date);
          },
        );
      },
      child: Center(
        child: Container(
          height: 52,
          width: 52,
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  40,
                ),
              ),
              color: AppTheme.mainBlue),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
