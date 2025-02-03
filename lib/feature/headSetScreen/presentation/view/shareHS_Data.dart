import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/selectDoctor.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';


class ShareHSData extends StatefulWidget {
  const ShareHSData({super.key});

  @override
  State<ShareHSData> createState() => _ShareHSDataState();
}

class _ShareHSDataState extends State<ShareHSData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBar(showBackArrow: true,),

             Expanded(
               child: SingleChildScrollView(
                 child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                 
                            Center(
                              child: Text("Share with", 
                              style: TextStyle(
                                          fontSize: 30.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Roboto",
                                        ),),
                            ) ,
                           CustomTextField(
                           labelText: "Search",
                           width: 328.w,
                           suffixIcon: IconButton(onPressed: (){}, 
                           icon: Icon(Icons.search ,color: Colors.white,)),),
                 
                          //  SelectDoctor(showCheckbox: true, onTap: (){},),
                          //  SelectDoctor(showCheckbox: true, onTap: (){},),
                           
                      ],
                    ),
               ),
             ),
            
            
        ],
      )),
    );
  }
}

