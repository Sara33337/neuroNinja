import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            // App Bar
            appBar(
              showChatIcon: true,
              showNotificationIcon: true,
            ),

            // Main content area with scrollable section
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Container(
                      width: 273.w,
                      height: 268.h,
                      
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFF82FFA),
              width: 2,
            ),
            image: DecorationImage(
              image: AssetImage("assets/images/chatBot.png"),
              fit: BoxFit.fill,)
                      ),
                    
                    ),

                    // Title text
                     Text(
                        "What can I help with?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  

                    
                  ],
                ),
              ),
            ),

            Container(
                      height: 49.h,
                      width: 361.w,
                      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: Color(0xFFC9C9C9),
                          borderRadius: BorderRadius.circular(16.r)
                      ),
                    
                      
                      child: TextField(
                      
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 21.w, vertical: 15.h),

                              hintText: "Write your inquiry",
                              hintStyle: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.50),
                          ) ,
                           
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              
                            ),
                          ),

                          suffixIcon: 
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_up_outlined ,
                           color: Color(0xFF430098),
                           size: 30.r,))
                        
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
