import 'dart:io';

import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/GetReportModel.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';


Future<void> createExcelFile(List<StudentsList> students) async {
  // Request storage permissions
  var status = await Permission.storage.request();
  if (!status.isGranted) {
    print("Storage permission denied");
    return;
  }

  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];

  // Add headers
  sheetObject.appendRow([
    TextCellValue("ID"),
    TextCellValue("Student name"),
    TextCellValue("National ID"),
    TextCellValue("Status")
  ]);

  // Add student data
  for (var student in students) {
    sheetObject.appendRow([
      TextCellValue(student.userId.toString()),
      TextCellValue(student.name.toString()),
      TextCellValue(student.nationalId.toString()),
      TextCellValue("Done")
    ]);
  }

  Directory? directory = await getExternalStorageDirectory();
  if (directory == null) {
    print("Unable to get external storage directory");
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

    print("File path: ${file.path}");
    print("File exists: ${file.existsSync()}");

    // Attempt to open the file
    try {
      final result = await OpenFile.open(file.path);
      print("Open result: ${result.message}");
    } catch (e) {
      print("Error opening file: $e");
    }
  } else {
    print("Failed to save file");
  }
}
