import 'package:attendo/core/networking/api_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/helpers/common.dart';
import '../../../../../../core/widgets/custom_snack_bar.dart';
import '../../../attendance_page/presentation/view/widgets/excell_functions.dart';
import '../view_model/cubits/get_lectures_reports_cubit.dart';

class LectureReportPage extends StatefulWidget {
  final int lecturePk;

  const LectureReportPage({super.key, required this.lecturePk});

  @override
  State<LectureReportPage> createState() => _LectureReportPageState();
}

class _LectureReportPageState extends State<LectureReportPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetLecturesReportsCubit>().getLectureReport(widget.lecturePk);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child:
                BlocBuilder<GetLecturesReportsCubit, GetLecturesReportsState>(
              builder: (context, state) {
                if (state is GetLecturesReportsSuccess) {
                  if (state.reportModel.isEmpty) {
                    return const Center(child: Text("No Data"));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  state.reportModel[0].lectureName ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 30.sp,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 584.h,
                          width: 328.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              23,
                            ),
                            color: const Color(
                              0xFFF1F1F1,
                            ),
                          ),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: ListTile(
                                    leading: CachedNetworkImage(
                                      imageBuilder: (context, imageProvider) {
                                        return Container(
                                          height: 50.h,
                                          width: 50.h,
                                          decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  40,
                                                ),
                                              ),
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill)),
                                        );
                                      },
                                      imageUrl:
                                          '${ApiStrings.baseUrl}${state.reportModel[0].studentsList?[index].photo}',
                                    ),
                                    title: Text(
                                      state.reportModel[0].studentsList?[index]
                                              .name ??
                                          "",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "ID:${state.reportModel[0].studentsList?[index].nationalId?? ""}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(fontSize: 12),
                                        )
                                      ],
                                    ),
                                    trailing: SizedBox(
                                      width: 100,
                                      height: 20,
                                      child: Text(
                                        state.reportModel[0].authorizationTime
                                            .toString(),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    )),
                              );
                            },
                            itemCount:
                                state.reportModel[0].studentsList?.length,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await createExcelFile(
                                state.reportModel[0].studentsList!,
                                state.reportModel[0].lectureName!,
                                DateTime.now().toString());
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                GlobalSnackBar.show(context,
                                    'Excel file created successfully! , saved to downloads'),
                              );
                            }
                          },
                          style: ButtonStyle(
                            fixedSize: WidgetStateProperty.all(
                              Size(246.w, 53.h),
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  16.w,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            getAppLocalizations(context)!.downloadFullList,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                } else if (state is GetLecturesReportsFailure) {
                  return Center(child: Text(state.errMessage));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
