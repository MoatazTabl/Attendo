import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:attendo/intro/student/features/profile/presentation/view/widgets/user_info_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/helpers/common.dart';

class ProfileScreenStudent extends StatelessWidget {
  const ProfileScreenStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  getAppLocalizations(context)!.profile,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: "${ApiStrings.baseUrl}${state.userData.photo}",
                    height: 105.h,
                    width: 105.h,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                UserInfoItem(
                  fieldName: getAppLocalizations(context)!.mail,
                  fieldDetail: state.userData.email ?? "",
                  iconPath: AppImages.emailIcon,
                ),
                UserInfoItem(
                  fieldName: getAppLocalizations(context)!.iD,
                  fieldDetail: state.userData.nationalId,
                  iconPath: AppImages.nationalIdIcon,
                ),
                UserInfoItem(
                  fieldName: getAppLocalizations(context)!.grade,
                  fieldDetail: state.userData.grade!,
                  iconPath: AppImages.gradeIcon,
                ),
              ],
            ),
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
