import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/widgets/custom_drop_down_button.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/instructor/features/create_lecture/logic/create_lecture_cubit.dart';
import 'package:attendo/intro/instructor/features/create_lecture/presentation/widgets/create_lecture_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CreateLectureInstructor extends StatefulWidget {
  const CreateLectureInstructor({super.key, required this.userDataModel});

  final UserDataModel userDataModel;

  @override
  State<CreateLectureInstructor> createState() =>
      _CreateLectureInstructorState();
}

class _CreateLectureInstructorState extends State<CreateLectureInstructor> {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AppImages.backgroundImage), fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            autovalidateMode: autoValidateMode,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 125.h,
                  ),
                  Text(
                    getAppLocalizations(context)!.createLecture,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                  CreateLecturesTextField(
                    hintText: getAppLocalizations(context)!.enterCourseName,
                    textEditingController: courseName,
                    enabled: true,
                    validator: validator,
                  ),
                  CustomFormDropDownButton(
                    fieldHint: getAppLocalizations(context)!.chooseGrade,
                    list: const ["First", "Second", "Third", "Fourth"],
                    onValueChanged: (value) {
                      chooseGrade.text = value!;
                    },
                    type: "grade",
                  ),
                  CustomFormDropDownButton(
                    fieldHint: getAppLocalizations(context)!.chooseFaculty,
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
                      selectDate.text = date?.toIso8601String().split("T")[0] ??
                          DateTime.now().toIso8601String().split("T")[0];

                      setState(() {});
                    },
                    child: CreateLecturesTextField(
                      hintText: getAppLocalizations(context)!.selectDate,
                      suffixIcon: SvgPicture.asset(AppImages.calenderIcon),
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
                      selectStartTime.text = from24to12(iso.toIso8601String())!;
                      setState(() {});
                    },
                    child: CreateLecturesTextField(
                      hintText: getAppLocalizations(context)!.selectStartTime,
                      suffixIcon: SvgPicture.asset(AppImages.timeIcon),
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
                      suffixIcon: SvgPicture.asset(AppImages.timeIcon),
                      textEditingController: selectEndTime,
                      enabled: false,
                      validator: lectureTimeValidator,
                    ),
                  ),
                  CreateLecturesTextField(
                    hintText: getAppLocalizations(context)!.lectureHall,
                    suffixIcon: SvgPicture.asset(AppImages.locationIcon),
                    textEditingController: lectureHall,
                    enabled: true,
                    validator: validator,
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  BlocConsumer<CreateLectureCubit, CreateLectureState>(
                    listener: (BuildContext context, CreateLectureState state) {
                      state.maybeWhen(
                        orElse: () {},
                        addError: (errorMessage) {
                          return GlobalSnackBar.show(context, errorMessage);
                        },
                        addLecture: () {
                          GlobalSnackBar.show(
                              context,
                              getAppLocalizations(context)!
                                  .lectureCreatedSuccessfully);
                          context.pop();
                        },
                      );
                    },
                    builder: (context, state) => ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(
                          Size(
                            215.w,
                            56.h,
                          ),
                        ),
                        maximumSize: WidgetStateProperty.all(
                          Size(
                            215.w,
                            56.h,
                          ),
                        ),
                      ),
                      onPressed: () {
                        autoValidateMode = AutovalidateMode.onUserInteraction;
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<CreateLectureCubit>()
                              .createLecture(data: {
                            "name": courseName.text,
                            "instructor": widget.userDataModel.name,
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
                        getAppLocalizations(context)!.addLecture,
                      ),
                    ),
                  ),
                ],
              ),
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

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field Cannot be empty";
    }

    return null;
  }

  String? from24to12(String? dateTime) {
    var dateFormat = DateFormat.jm().format(DateTime.parse(dateTime ?? ""));
    return dateFormat;
  }

  String? from12to24(String? dateTime) {
    var dateFormat = DateFormat("yyyy-MM-dd hh:mm a").parse(dateTime!);

    return dateFormat.toIso8601String();
  }
}
