import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/login&signupButton.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';
import 'package:neuro_ninja/feature/userType/presentation/view/userType.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
          child: Column(
            children: [
               appBar(),
               
              Expanded(
                child: SingleChildScrollView(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                                
                      SizedBox(height: 50.h),
                      Center(
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                            fontSize: 32.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                                
                      SizedBox(height: 20.h),
                      CustomTextField(
                        width: 360,
                        labelText: "Username",
                        hintText: "Enter your name",
                        suffixIcon:  IconButton(
                          onPressed: (){}, icon: Icon(Icons.clear ,  color: Colors.white.withOpacity(0.60))),
                      
                      ),
                      CustomTextField(
                        width: 360,
                        labelText: "E-mail",
                        hintText: "Enter your e-mail",
                        suffixIcon:  IconButton(
                          onPressed: (){}, icon: Icon(Icons.clear ,  color: Colors.white.withOpacity(0.60))),
                      
                      ),
                      CustomTextField(
                        width: 360,
                        labelText: "Password",
                        hintText: "Enter your password",
                        suffixIcon:  IconButton(
                          onPressed: (){}, icon: Icon(Icons.visibility_off_outlined ,  color: Colors.white.withOpacity(0.60))),
                        
                      ),
                      CustomTextField(
                        width: 360,
                        labelText: "Repeat password",
                        hintText: "Repeat your password",
                        suffixIcon:  IconButton(
                          onPressed: (){}, icon: Icon(Icons.visibility_off_outlined ,  color: Colors.white.withOpacity(0.60))),
                      
                      ),
                                
                      ColoredButton(
                          buttonText: "Sign up",
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return UserType();
                            }));
                          }),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 30),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Color(0xFFA1A1A1),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Or",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: Color(0xFFA1A1A1),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: Color(0xFFA1A1A1),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      login_signu_with(
                        logoImage: "assets/images/flat-color-icons_google.png",
                        buttonText: "Sign up with Google",
                        onTap: () {},
                      ),
                      login_signu_with(
                        logoImage: "assets/images/logos_facebook.png",
                        buttonText: "Sign up with Facebook",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 25,
                      ),
                                
                      SizedBox(height: 50.h), // Add space at the end
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
