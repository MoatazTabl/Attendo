import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/instructor/features/report_history/presentation/view_model/cubits/get_lectures_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ReportHistory extends StatefulWidget {
  final UserDataModel userData;

  const ReportHistory({super.key, required this.userData});

  @override
  State<ReportHistory> createState() => _ReportHistoryState();
}

class _ReportHistoryState extends State<ReportHistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<GetLecturesHistoryCubit>()
        .getLecturesHistory(widget.userData.name);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<GetLecturesHistoryCubit, GetLecturesHistoryState>(
        builder: (context, state) {
          if (state is GetLecturesHistorySuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  "Lectures History",
                  style: TextStyle(fontSize: 24),
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          context.push("/LectureReportPage",
                              extra: state.lectures[index].pk);
                        },
                        title: Text(state.lectures[index].name!),
                      );
                    },
                    itemCount: state.lectures.length,
                  ),
                )
              ],
            );
          } else if (state is GetLecturesHistoryFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
