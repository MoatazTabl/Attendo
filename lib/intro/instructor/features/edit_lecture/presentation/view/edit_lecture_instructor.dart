import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/widgets/custom_drop_down_button.dart';
import 'package:attendo/intro/instructor/features/create_lecture/logic/create_lecture_cubit.dart';
import 'package:attendo/intro/instructor/features/create_lecture/presentation/widgets/create_lecture_text_field.dart';
import 'package:attendo/intro/instructor/features/edit_lecture/logic/edit_lecture_cubit.dart';
import 'package:attendo/intro/instructor/features/home/presentation/data/models/InstructorLecturesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  TextEditingController selectTime = TextEditingController();
  TextEditingController lectureHall = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    courseName.text = widget.instructorLecturesModel.name!;
    chooseGrade.text = widget.instructorLecturesModel.grade!;
    chooseFaculty.text = widget.instructorLecturesModel.faculty!;
    selectDate.text = widget.instructorLecturesModel.lectureStartTime!;
    selectTime.text = widget.instructorLecturesModel.lectureStartTime!;
    lectureHall.text = widget.instructorLecturesModel.lectureHall!;
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    selectTime.text = iso
                        .toIso8601String()
                        .split("T")[1]
                        .split(".")[0]
                        .split(":00")[0];
                    setState(() {});
                  },
                  child: CreateLecturesTextField(
                    hintText: getAppLocalizations(context)!.selectTime,
                    suffixIcon: SvgPicture.asset(AppImages.timeIcon),
                    textEditingController: selectTime,
                    enabled: false,
                  ),
                ),
                CreateLecturesTextField(
                  hintText: getAppLocalizations(context)!.lectureHall,
                  suffixIcon: SvgPicture.asset(AppImages.locationIcon),
                  textEditingController: lectureHall,
                  enabled: true,
                ),
                SizedBox(
                  height: 19.h,
                ),
                BlocConsumer<EditLectureCubit, EditLectureState>(
                  listener: (BuildContext context, EditLectureState state) {
                    state.maybeWhen(
                      orElse: () {},
                      // addError: (errorMessage) {
                      //   return GlobalSnackBar.show(context, errorMessage);
                      // },
                      // addLecture: () {
                      //   GlobalSnackBar.show(
                      //       context, "Lecture Created Successfully");
                      //   context.pop();
                      // },
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
                      if (_formKey.currentState!.validate()) {
                        context.read<CreateLectureCubit>().createLecture(data: {
                          "name": courseName.text,
                          "instructor": widget.instructorLecturesModel.name,
                          "lecture_hall": lectureHall.text,
                          "faculty": chooseFaculty.text,
                          "grade": chooseGrade.text,
                          "lecture_start_time":
                              "${selectDate.text}T${selectTime.text}:00",
                          "lecture_end_time":
                              "${selectDate.text}T${selectTime.text}:00"
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
}
