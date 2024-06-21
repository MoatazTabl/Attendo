import 'dart:io';

import 'package:attendo/core/app_images.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerInputController extends ValueNotifier<File?> {
  ImagePickerInputController({File? initialValue}) : super(initialValue);

  String get fileName => value?.path.split('/').last ?? '';

  // File? get file=>value;

  set file(File? newValue) {
    if (newValue?.path == value?.path) return;

    value = newValue;
    notifyListeners();
  }
}

class ImagePickFormWidget extends FormField<File> {
  ImagePickFormWidget(
      {super.key,
      super.validator,
      super.autovalidateMode,
      ImagePickerInputController? controller,
      ValueChanged<File?>? onChanged})
      : super(
          initialValue: controller?.value,
          enabled: true,
          builder: (state) {
            void onChangedHandler(File? value) {
              state.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return ImagePickWidget(
        color: state.hasError ? Colors.red : Colors.cyan,
        onChanged: onChangedHandler,
      );
    },
  );
}

class ImagePickWidget extends StatefulWidget {
  const ImagePickWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.color,
  });

  final ImagePickerInputController? controller;
  final ValueChanged<File?>? onChanged;
  final Color? color;

  @override
  State<ImagePickWidget> createState() => _ImagePickWidgetState();
}

class _ImagePickWidgetState extends State<ImagePickWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late ImagePickerInputController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? ImagePickerInputController();
    controller.addListener(() {
      widget.onChanged?.call(controller.value);
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 55.r, end: 75.r).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant ImagePickWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      controller = widget.controller ?? ImagePickerInputController();
      controller.addListener(() {
        widget.onChanged?.call(controller.value);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    if (widget.controller == null) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return GestureDetector(
            onTap: () async {
              await pickImage();
            },
            child: CircleAvatar(
              radius: _animation.value,
              backgroundColor: widget.color,
              child: CircleAvatar(
                radius: 55.r,
                child: ValueListenableBuilder(
                  valueListenable: controller,
                  builder:
                      (BuildContext context, File? imgFile, Widget? child) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(44.r),
                      child: imgFile == null
                          ? Image.asset(
                              AppImages.addAvatarImage,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            )
                          : Image.file(
                              imgFile,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> pickImage() async {
    try {
      final XFile? image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 80);

      controller.file = File(image!.path);
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }
}
