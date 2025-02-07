import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _signUp() async {
  String email = _emailController.text.trim();
  String password = _passwordController.text.trim();
  String repeatPassword = _repeatPasswordController.text.trim();

  if (password != repeatPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Passwords do not match!')),
    );
    return;
  }

  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = userCredential.user;
    
    if (user != null) {
      await user.sendEmailVerification(); // Send verification email
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification email sent. Please check your inbox.')),
      );

      // Wait for the user to verify their email
      await _checkEmailVerification(user);
    }
  } on FirebaseAuthException catch (e) {
    String message = 'An error occurred';
    if (e.code == 'weak-password') {
      message = 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      message = 'The account already exists for that email.';
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}

Future<void> _checkEmailVerification(User user) async {
  await user.reload(); // Refresh user state
  while (!user.emailVerified) {
    await Future.delayed(Duration(seconds: 3)); // Check every 3 seconds
    await user.reload();
    user = FirebaseAuth.instance.currentUser!;
  }
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Email verified successfully!')),
  );

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserType()));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                      controller: _usernameController,
                      width: 360,
                      labelText: "Username",
                      hintText: "Enter your name",
                      suffixIcon: IconButton(
                        onPressed: () => _usernameController.clear(),
                        icon: Icon(Icons.clear, color: Colors.white.withOpacity(0.60)),
                      ),
                    ),
                    CustomTextField(
                      controller: _emailController,
                      width: 360,
                      labelText: "E-mail",
                      hintText: "Enter your e-mail",
                      suffixIcon: IconButton(
                        onPressed: () => _emailController.clear(),
                        icon: Icon(Icons.clear, color: Colors.white.withOpacity(0.60)),
                      ),
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      width: 360,
                      labelText: "Password",
                      hintText: "Enter your password",
                      obscureText: true,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off_outlined, color: Colors.white.withOpacity(0.60)),
                      ),
                    ),
                    CustomTextField(
                      controller: _repeatPasswordController,
                      width: 360,
                      labelText: "Repeat password",
                      hintText: "Repeat your password",
                      obscureText: true,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off_outlined, color: Colors.white.withOpacity(0.60)),
                      ),
                    ),
                    ColoredButton(
                      buttonText: "Sign up",
                      onTap: _signUp,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(color: Color(0xFFA1A1A1), thickness: 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Or",
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp, color: Color(0xFFA1A1A1)),
                            ),
                          ),
                          const Expanded(
                            child: Divider(color: Color(0xFFA1A1A1), thickness: 1),
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
                    SizedBox(height: 25),
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
