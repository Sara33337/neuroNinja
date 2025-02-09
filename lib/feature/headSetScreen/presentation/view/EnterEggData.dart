import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/feature/headSetScreen/logic/services/apiService.dart';
import 'package:neuro_ninja/feature/headSetScreen/presentation/view/showResults.dart';
import 'package:permission_handler/permission_handler.dart';

class EGGInputScreen extends StatefulWidget {
  @override
  _EGGInputScreenState createState() => _EGGInputScreenState();
}


class _EGGInputScreenState extends State<EGGInputScreen> {
  bool showSendButton = false;
  File? _file;
  String? _fileName; // Variable to hold the selected file name

  @override
  void initState() {
    super.initState();
    requestStoragePermission(); // Request permission when the screen loads
  }

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      print("Storage permission granted");
    } else if (status.isDenied) {
      print("Storage permission denied. Asking for permission...");
      await openAppSettings();
    }

    // For Android 10+ (API level 29 and above), check for MANAGE_EXTERNAL_STORAGE permission
    if (await Permission.manageExternalStorage.isDenied) {
      var managePermission = await Permission.manageExternalStorage.request();
      if (managePermission.isDenied) {
        print("Manage External Storage permission still denied.");
        return;
      }
    }
  }

  Future<void> _pickFile() async {
    var status = await Permission.storage.request();
    if (status.isDenied) {
      print("Storage permission denied. Requesting again...");
      await openAppSettings();
      return;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
        _fileName = result.files.single.name; // Store the file name
        showSendButton = true;
      });
    } else {
      print("User canceled the file picker");
    }
  }

  // Use the FileUploadService to upload the file
  Future<void> _uploadFile() async {
    if (_file == null) return;

    ApiService fileUploadService = ApiService();
    await fileUploadService.uploadFile(_file!);

    // Navigate to the result screen after uploading
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShowResult(fileName: _fileName!), // Pass the file name
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            appBar(
              showBackArrow: true,
              showChatIcon: true,
              showNotificationIcon: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        "Attach CSV File",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      ColoredButton(
                        buttonText: "Select CSV File",
                        onTap: () {
                          _pickFile();
                          print("file selected");
                        },
                      ),
                      SizedBox(height: 30.h),
                      // Display the selected file name
                      if (_fileName != null)
                        Text(
                          "Selected file: $_fileName",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      SizedBox(height: 30.h),
                      if (showSendButton)
                        ColoredButton(
                          buttonText: "Send",
                          onTap: () {
                            _uploadFile();
                            print("file uploaded");
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
