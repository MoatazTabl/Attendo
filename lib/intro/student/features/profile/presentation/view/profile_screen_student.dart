import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:attendo/intro/student/features/profile/presentation/view/widgets/user_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/common.dart';

class ProfileScreenStudent extends StatelessWidget {
  const ProfileScreenStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 64.h,
              ),
              Image.asset(
                "assets/images/avatar_pic.png",
                width: 106.w,
                height: 108.h,
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 24.h,
              ),
              UserInfoItem(
                fieldName: getAppLocalizations(context)!.name,
                fieldDetail: state.userData.name,
              ),
              UserInfoItem(
                fieldName: getAppLocalizations(context)!.iD,
                fieldDetail: state.userData.nationalId,
              ),
              UserInfoItem(
                fieldName: getAppLocalizations(context)!.faculty,
                fieldDetail: state.userData.faculty!,
              ),
              UserInfoItem(
                fieldName: getAppLocalizations(context)!.grade,
                fieldDetail: state.userData.grade!,
              ),
            ],
          );
        } else if (state is GetUserLoading) {
          return const CircularProgressIndicator();
        } else {
          return const Text("Something went Wrong");
        }
      },
    );
  }
}
