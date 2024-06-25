import 'dart:io';

import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/get_report_model.dart';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


Future<void> createExcelFile(List<StudentsList> students,String lectureName , String date) async {
  // Request storage permissions
  var status = await Permission.storage.request();
  if (!status.isGranted) {
    if (kDebugMode) {
      print("Storage permission denied");
    }
    return;
  }

  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];

  // Add lecture name and date as headers
  sheetObject.appendRow([
    TextCellValue(lectureName),
  ]);
  sheetObject.appendRow([
    TextCellValue(date),
  ]);

  // Add an empty row for separation
  sheetObject.appendRow([]);


  // Add headers
  sheetObject.appendRow([
    const TextCellValue("num"),
    const TextCellValue("Student name"),
    const TextCellValue("National ID"),
  ]);

  // Add student data
  for (var student in students) {
    int i = 1;
    sheetObject.appendRow([
      TextCellValue(i.toString()),
      TextCellValue(student.name.toString()),
      TextCellValue(student.nationalId.toString()),
    ]);
    i++;
  }

  Directory? directory = await getExternalStorageDirectory();
  if (directory == null) {
    if (kDebugMode) {
      print("Unable to get external storage directory");
    }
    return;
  }

  // Define the Downloads directory path
  String downloadsDirectoryPath = "/storage/emulated/0/Download";
  String outputFile = "$downloadsDirectoryPath/students.xlsx";
  List<int>? fileBytes = excel.save();

  if (fileBytes != null) {
    File file = File(outputFile)
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes);

    // print("File path: ${file.path}");
    // print("File exists: ${file.existsSync()}");

    // Attempt to open the file
    try {
      final result = await OpenFile.open(file.path);
      if (kDebugMode) {
        print("Open result: ${result.message}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error opening file: $e");
      }
    }
  } else {
    if (kDebugMode) {
      print("Failed to save file");
    }
  }
}
