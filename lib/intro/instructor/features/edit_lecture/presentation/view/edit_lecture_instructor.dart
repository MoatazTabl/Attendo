import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/intro/instructor/features/create_lecture/presentation/view/widgets/create_lecture_drop_down_menu.dart';
import 'package:attendo/intro/instructor/features/create_lecture/presentation/view/widgets/create_lecture_text_field.dart';
import 'package:attendo/intro/instructor/features/edit_lecture/logic/edit_lecture_cubit.dart';
import 'package:attendo/intro/instructor/features/home/data/models/instructor_lectures_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EditLectureInstructor extends StatefulWidget {
  const EditLectureInstructor(
      {super.key, required this.instructorLecturesModel});

  final InstructorLecturesModel instructorLecturesModel;

  @override
  State<EditLectureInstructor> createState() => _EditLectureInstructorState();
}

class _EditLectureInstructorState extends State<EditLectureInstructor> {
  TextEditingController courseName = TextEditingController();
  TextEditingController chooseGrade = TextEditingController();
  TextEditingController chooseFaculty = TextEditingController();
  TextEditingController selectDate = TextEditingController();
  TextEditingController selectStartTime = TextEditingController();
  TextEditingController selectEndTime = TextEditingController();
  TextEditingController lectureHall = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    courseName.text = widget.instructorLecturesModel.name!;
    chooseGrade.text = widget.instructorLecturesModel.grade!;
    chooseFaculty.text = widget.instructorLecturesModel.faculty!;
    lectureHall.text = widget.instructorLecturesModel.lectureHall!;
    selectDate.text =
        widget.instructorLecturesModel.lectureStartTime!.split("T")[0];

    selectStartTime.text =
        from24to12(widget.instructorLecturesModel.lectureStartTime!)!;
    selectEndTime.text =
        from24to12(widget.instructorLecturesModel.lectureEndTime!)!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditLectureCubit(),
      child: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: 415.h,
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                      getAppLocalizations(context)!.createLecture,
                      style: GoogleFonts.poppins(
                          fontSize: 25.sp, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    CreateLecturesTextField(
                      hintText: getAppLocalizations(context)!.enterCourseName,
                      textEditingController: courseName,
                      enabled: true,
                      validator: validator,
                    ),
                    CreateLectureDropDownMenu(
                      fieldHint: getAppLocalizations(context)!.chooseGrade,
                      initialValue: chooseGrade.text,
                      list: const ["First", "Second", "Third", "Fourth"],
                      onValueChanged: (value) {
                        chooseGrade.text = value!;
                      },
                      type: "grade",
                    ),
                    CreateLectureDropDownMenu(
                      fieldHint: getAppLocalizations(context)!.chooseFaculty,
                      initialValue: chooseFaculty.text,
                      list: const ["Computers", "Commerce"],
                      onValueChanged: (value) {
                        chooseFaculty.text = value!;
                      },
                      type: "faculty",
                    ),
                    GestureDetector(
                      onTap: () async {
                        DateTime dateTimeNow = DateTime.now();
                        var date = await showDatePicker(
                          context: context,
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          firstDate: dateTimeNow,
                          lastDate: dateTimeNow.add(
                            const Duration(
                              days: 30,
                            ),
                          ),
                          initialDate: dateTimeNow,
                        );
                        selectDate.text =
                            date?.toIso8601String().split("T")[0] ??
                                DateTime.now().toIso8601String().split("T")[0];

                        setState(() {});
                      },
                      child: CreateLecturesTextField(
                        hintText: getAppLocalizations(context)!.selectDate,
                        textEditingController: selectDate,
                        enabled: false,
                        validator: validator,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        var time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.inputOnly,
                        );
                        var now = DateTime.now();
                        var iso = DateTime(now.year, now.month, now.day,
                            time!.hour, time.minute);
                        selectStartTime.text =
                            from24to12(iso.toIso8601String())!;
                        setState(() {});
                      },
                      child: CreateLecturesTextField(
                        hintText: getAppLocalizations(context)!.selectStartTime,
                        textEditingController: selectStartTime,
                        enabled: false,
                        validator: validator,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        var time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.inputOnly,
                        );
                        var now = DateTime.now();
                        var iso = DateTime(now.year, now.month, now.day,
                            time!.hour, time.minute);
                        selectEndTime.text = from24to12(iso.toIso8601String())!;
                        setState(() {});
                      },
                      child: CreateLecturesTextField(
                        hintText: getAppLocalizations(context)!.selectEndTime,
                        textEditingController: selectEndTime,
                        enabled: false,
                        validator: lectureTimeValidator,
                      ),
                    ),
                    CreateLecturesTextField(
                      hintText: getAppLocalizations(context)!.lectureHall,
                      textEditingController: lectureHall,
                      enabled: true,
                      validator: validator,
                    ),
                    BlocConsumer<EditLectureCubit, EditLectureState>(
                      listener: (BuildContext context, EditLectureState state) {
                        state.maybeWhen(
                          orElse: () {},
                          editError: (errorMessage) {
                            if (kDebugMode) {
                              print(errorMessage);
                            }
                          },
                          editLectureDone: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                      builder: (context, state) => ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: WidgetStateProperty.all(
                              Size(
                                170.w,
                                43.h,
                              ),
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(AppTheme.mainBlue)),
                        onPressed: () {
                          autoValidateMode = AutovalidateMode.onUserInteraction;
                          if (_formKey.currentState!.validate()) {
                            context.read<EditLectureCubit>().editLecture(data: {
                              "pk": widget.instructorLecturesModel.pk,
                              "name": courseName.text,
                              "instructor": widget
                                  .instructorLecturesModel.instructorInfo?.name,
                              "lecture_hall": lectureHall.text,
                              "faculty": chooseFaculty.text,
                              "grade": chooseGrade.text,
                              "lecture_start_time": from12to24(
                                  "${selectDate.text} ${selectStartTime.text}"),
                              "lecture_end_time": from12to24(
                                  "${selectDate.text} ${selectEndTime.text}")
                            });
                          }
                        },
                        child: Text(
                          getAppLocalizations(context)!.editLecture,
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? lectureTimeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field Cannot be empty";
    }
    String? startTimeString =
        from12to24("${selectDate.text} ${selectStartTime.text}");
    DateTime startTime = DateTime.parse(startTimeString!);

    String? endTimeString =
        from12to24("${selectDate.text} ${selectEndTime.text}");
    var endTime = DateTime.parse(endTimeString!);
    var diff = endTime.difference(startTime);
    if (diff.isNegative) {
      return "Lecture End Time Cannot be before Start Time";
    }
    if (diff.inMicroseconds == 0) {
      return "Lecture Cannot End At The Same Time";
    }
    return null;
  }
}
