import 'dart:io';
import 'package:attendo/core/app_images.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FingerPrintScanScreen extends StatefulWidget {
  const FingerPrintScanScreen({super.key});

  @override
  State<FingerPrintScanScreen> createState() => _FingerPrintScanScreenState();
}

class _FingerPrintScanScreenState extends State<FingerPrintScanScreen> {

   XFile? _capturedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OOP Lecture'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250.w,
                height: 250.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      onError: (exception, stackTrace) =>
                          const AssetImage(AppImages.welcomePageStudentImage),
                      image: FileImage(File(_capturedImage?.path??"")),
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(25)),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          ElevatedButton(
            onPressed: () async {
              // await context.push("/cameraScreen");
             XFile? capturedImage = await context.push('/cameraScreen') as XFile?;
              if (capturedImage != null) {
                setState(() {
                  _capturedImage = capturedImage;
                  if (kDebugMode) {
                    print(_capturedImage!.path);
                  }
                });
              }
            },
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                Size(258.w, 89.h),
              ),
              backgroundColor: MaterialStateProperty.all(
                const Color(0xff2403F1).withOpacity(
                  .42,
                ),
              ),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    32.w,
                  ),
                ),
              ),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all(
                EdgeInsets.zero,
              ),
            ),
            child: Text(
              " Capture FingerPrint",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20.sp,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () async {
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(258.w, 89.h),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xff2403F1).withOpacity(
                    .42,
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      32.w,
                    ),
                  ),
                ),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
              ),
              child: Text(
                " Next ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
