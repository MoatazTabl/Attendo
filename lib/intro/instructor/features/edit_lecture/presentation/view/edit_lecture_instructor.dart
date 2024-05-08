import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/widgets/custom_drop_down_button.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/instructor/features/create_lecture/presentation/widgets/create_lecture_text_field.dart';
import 'package:attendo/intro/instructor/features/edit_lecture/logic/edit_lecture_cubit.dart';
import 'package:attendo/intro/instructor/features/home/presentation/data/models/instructor_lectures_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class EditLectureInstructor extends StatefulWidget {
  const EditLectureInstructor({
    super.key,
    required this.instructorLecturesModel,
  });

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
    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              AppImages.backgroundImage,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 125.h,
                ),
                Text(
                  getAppLocalizations(context)!.editLecture,
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
                  initialValue: widget.instructorLecturesModel.grade!,
                ),
                CustomFormDropDownButton(
                  fieldHint: getAppLocalizations(context)!.chooseFaculty,
                  list: const ["Computers", "Commerce"],
                  onValueChanged: (value) {
                    chooseFaculty.text = value!;
                  },
                  type: "faculty",
                  initialValue: widget.instructorLecturesModel.faculty,
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
                        "${date?.toIso8601String().split("T")[0]}";

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
                    var iso = DateTime(
                        now.year, now.month, now.day, time!.hour, time.minute);
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
                    var iso = DateTime(
                        now.year, now.month, now.day, time!.hour, time.minute);
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
                BlocConsumer<EditLectureCubit, EditLectureState>(
                  listener: (BuildContext context, EditLectureState state) {
                    state.maybeWhen(
                      orElse: () {},
                      editError: (errorMessage) {
                        return GlobalSnackBar.show(context, errorMessage);
                      },
                      editLectureDone: () {
                        GlobalSnackBar.show(context,
                            getAppLocalizations(context)!.lectureEdited);
                        context.pop();
                      },
                    );
                  },
                  builder: (context, state) => ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        Size(
                          215.w,
                          56.h,
                        ),
                      ),
                      maximumSize: MaterialStateProperty.all(
                        Size(
                          215.w,
                          56.h,
                        ),
                      ),
                    ),
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
                    ),
                  ),
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
