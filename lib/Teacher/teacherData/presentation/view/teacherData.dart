import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';
import 'package:neuro_ninja/feature/done/registrationDone.dart';

class TeacherData extends StatefulWidget {
  const TeacherData({super.key});

  @override
  State<TeacherData> createState() => _TeacherDataState();
}

class _TeacherDataState extends State<TeacherData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nationalIDController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _saveTeacherData() async {
    if (_nameController.text.isEmpty ||
        _ageController.text.isEmpty ||
        _schoolController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _nationalIDController.text.isEmpty ||
        _locationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    try {
      // Get the currently logged-in user's ID
      String? userId = _auth.currentUser?.uid;

      if (userId != null) {
        await _firestore.collection("teachers").doc(userId).set({
          'userId': userId, // Store the Firebase user ID
          'name': _nameController.text,
          'age': _ageController.text,
          'school': _schoolController.text,
          'phoneNumber': _phoneNumberController.text,
          'nationalID': _nationalIDController.text,
          'userLocation' : _locationController.text
        });

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RegistrationDone(userRole: "Teacher");
        }));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User not logged in")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving data: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(),
            SizedBox(height: 55.h),
            Center(
              child: Text(
                "Teacher Data",
                style: TextStyle(
                  fontSize: 32.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                CustomTextField(labelText: "Name", controller: _nameController, width: 200),
                CustomTextField(labelText: "Age", controller: _ageController, width: 100),
              ],
            ),
            CustomTextField(labelText: "School name", controller: _schoolController, width: 360),
            CustomTextField(labelText: "National ID", controller: _nationalIDController, width: 360),
            CustomTextField(labelText: "Phone number", controller: _phoneNumberController, width: 360),
            CustomTextField(labelText: "Location", controller: _locationController, width: 360),
            ColoredButton(
              buttonText: "Confirm",
              onTap: _saveTeacherData, // ✅ Call the function to save data before navigating
            ),
            unColoredButton(
              buttonText: "Back",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
