import 'package:attendo/core/networking/api_service.dart';
import 'package:attendo/intro/instructor/features/report_history/presentation/view/report_history.dart';
import 'package:attendo/intro/instructor/features/report_history/presentation/view_model/ReportHistoryLecturesModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_lectures_history_state.dart';

class GetLecturesHistoryCubit extends Cubit<GetLecturesHistoryState> {
  GetLecturesHistoryCubit() : super(GetLecturesHistoryInitial());

  getLecturesHistory() async{
    final response = await ApiService().post(endpoint: , data: {});

  }
}
