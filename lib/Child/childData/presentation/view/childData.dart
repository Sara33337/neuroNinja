import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';
import 'package:neuro_ninja/core/widgets/unColoredButton.dart';
import 'package:neuro_ninja/feature/done/registrationDone.dart';

class ChildData extends StatefulWidget {
  const ChildData({
    super.key,
    this.confirmTap,
    this.backTap,
    this.add_OR_confirm,
  });

  final VoidCallback? confirmTap;
  final VoidCallback? backTap;
  final String? add_OR_confirm;

  @override
  State<ChildData> createState() => _ChildDataState();
}

class _ChildDataState extends State<ChildData> {
  void _defaultConfirmTap() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return RegistrationDone(userRole: "Child");
    }));
  }

  void _defaultBackTap() {
    Navigator.pop(context);
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
                CustomTextField(labelText: "Name", width: 200),
                CustomTextField(labelText: "Age", width: 100),
              ],
            ),
            CustomTextField(labelText: "Scool name", width: 360),
            CustomTextField(labelText: "Parent number", width: 360),
            ColoredButton(
              buttonText: widget.add_OR_confirm ?? "Confirm",
              onTap: () {
                // Use custom confirmTap if provided, otherwise use default
                (widget.confirmTap ?? _defaultConfirmTap)();
              },
            ),
            unColoredButton(
              buttonText: "Back",
              onTap: () {
              
                (widget.backTap ?? _defaultBackTap)();
              },
            ),
          ],
        ),
      ),
    );
  }
}
