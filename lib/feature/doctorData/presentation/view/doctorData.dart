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

class DoctorData extends StatefulWidget {
  const DoctorData({super.key});

  @override
  State<DoctorData> createState() => _DoctorDataState();
}

class _DoctorDataState extends State<DoctorData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nationalIDController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _clinicController = TextEditingController();
  final TextEditingController _numberOfExpController = TextEditingController();
  final TextEditingController _fieldController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _saveDoctorData() async {
  

  // if (_nameController.text.isEmpty ||
  //     _ageController.text.isEmpty ||
  //     _schoolController.text.isEmpty ||
  //     _phoneNumberController.text.isEmpty ||
  //     _nationalIDController.text.isEmpty ||
  //     _locationController.text.isEmpty ||
  //     _clinicController.text.isEmpty ||
  //     _fieldController.text.isEmpty ||
  //     _numberOfExpController.text.isEmpty) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text("All fields are required")),
  //   );
  //   return;
  // }

  // Validate phone number format (basic example)
  // String phoneNumber = _phoneNumberController.text.trim();
  // if (!RegExp(r'^\d{10,15}$').hasMatch(phoneNumber)) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text("Invalid phone number format")),
  //   );
  //   return;
  // }

  // Validate age and experience as numbers
  // int? age = int.tryParse(_ageController.text.trim());
  // int? experience = int.tryParse(_numberOfExpController.text.trim());

  // if (age == null || age <= 0) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text("Invalid age")),
  //   );
  //   return;
  // }

  // if (experience == null || experience < 0) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text("Invalid number of years of experience")),
  //   );
  //   return;
  // }

  try {
    String? userId = _auth.currentUser?.uid;
    if (userId != null) {
      await _firestore.collection("doctors").doc(userId).set({
        'userId': userId,
        'name': _nameController.text,
        'age': _ageController.text,
        'school': _schoolController.text,
        'phoneNumber': _phoneNumberController.text,
        'nationalID': _nationalIDController.text,
        'userLocation': _locationController.text,
        'Clinic/Hospital Name': _clinicController.text,
        'Field of specialization': _fieldController.text,
        'Number of experience': _numberOfExpController.text
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return RegistrationDone(userRole: "Doctor");
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Doctor Data",
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
                        CustomTextField(
                            labelText: "Name",
                            controller: _nameController,
                            width: 200),
                        CustomTextField(
                            labelText: "Age",
                            controller: _ageController,
                            width: 100)
                      ],
                    ),
                    CustomTextField(
                        labelText: "Clinic / Hospital Name",
                        controller: _clinicController,
                        width: 360),
                    CustomTextField(
                        labelText: "School name",
                        controller: _schoolController,
                        width: 360),
                    CustomTextField(
                        labelText: "Phone number",
                        controller: _phoneNumberController,
                        width: 360),
                    CustomTextField(
                      labelText: "Location",
                      width: 360,
                      controller: _locationController,
                    ),
                    CustomTextField(
                        labelText: "Field of specialization",
                        controller: _fieldController,
                        width: 360),
                    CustomTextField(
                        labelText: "Number of experience",
                        controller: _numberOfExpController,
                        width: 360),
                    ColoredButton(
                        buttonText: "Confirm",
                        onTap: () {
                          _saveDoctorData();
                        }),
                    unColoredButton(
                        buttonText: "Back",
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
