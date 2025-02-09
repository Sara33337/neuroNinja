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

class ChildData extends StatefulWidget {
  const ChildData({super.key, this.confirmTap, this.backTap, this.add_OR_confirm});

  final VoidCallback? confirmTap;
  final VoidCallback? backTap;
  final String? add_OR_confirm;

  @override
  State<ChildData> createState() => _ChildDataState();
}

class _ChildDataState extends State<ChildData> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _parentNumberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _saveChildData() async {
    if (_userNameController.text.isEmpty ||
        _ageController.text.isEmpty ||
        _schoolController.text.isEmpty ||
        _parentNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    try {
      // Get the currently logged-in user's ID
      String? userId = _auth.currentUser?.uid;

      if (userId != null) {
        await _firestore.collection("children").doc(userId).set({
          'userId': userId, // Store the Firebase user ID
          'name': _userNameController.text,
          'age': _ageController.text,
          'school': _schoolController.text,
          'parentNumber': _parentNumberController.text,
          'userLocation' : _locationController.text
        });

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RegistrationDone(userRole: "Child");
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
                "Child Data",
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
                CustomTextField(labelText: "Name", controller: _userNameController, width: 200),
                CustomTextField(labelText: "Age", controller: _ageController, width: 100),
              ],
            ),
            CustomTextField(labelText: "School name", controller: _schoolController, width: 360),
            CustomTextField(labelText: "Parent number", controller: _parentNumberController, width: 360),
              CustomTextField(labelText: "Location", controller: _locationController, width: 360),
            ColoredButton(
              buttonText: widget.add_OR_confirm ?? "Confirm",
              onTap: _saveChildData,
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
