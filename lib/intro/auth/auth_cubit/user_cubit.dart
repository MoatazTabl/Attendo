import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/user_data_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
}
