import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCameraBlur extends StatelessWidget {

 final AlignmentGeometry? align;


  const CustomCameraBlur({super.key, this.align});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: align??Alignment.topCenter,
      child: SizedBox(
        width: 1.sw,
        height: 0.3.sh,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            color: Colors.white10.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
