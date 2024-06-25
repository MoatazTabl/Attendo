import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/instructor/features/report_history/presentation/view_model/cubits/get_lectures_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    context.read<GetLecturesHistoryCubit>().getLecturesHistory(
        widget.userData.name)
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(separatorBuilder: (context, index) {
              return Divider();
            }, itemBuilder: (context, index) {
              return ListTile(
                onTap: () {

                },
                title: Text("Ai"),
                trailing: Text("Ai"),
                leading: Text("Ai"),
              );
            }, itemCount: 5,),
          )
        ],
      ),
    );
  }
}
