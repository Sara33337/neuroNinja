import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:email_validator/email_validator.dart';
import 'package:neuro_ninja/core/constans/appBar.dart';
import 'package:neuro_ninja/core/widgets/backgroundColor.dart';
import 'package:neuro_ninja/core/widgets/coloredButton.dart';
import 'package:neuro_ninja/core/widgets/login&signupButton.dart';
import 'package:neuro_ninja/core/widgets/textField.dart';
import 'package:neuro_ninja/feature/resetPassword/presentation/view/forgetPassword.dart';
import 'package:neuro_ninja/feature/signup/presentation/view/signUpScreen.dart';
import 'package:neuro_ninja/feature/userType/presentation/view/userType.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful!')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const UserType()),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    }

    setState(() => _isLoading = false);
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Google Sign-In successful!')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const UserType()),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Google Sign-In failed: $e')),
        );
      }
    }
  }

  bool isValidEmail(String email) {
    return EmailValidator.validate(email);
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50.h),
                      Center(
                        child: Text(
                          "Login",
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
                        controller: _emailController,
                        width: 360,
                        labelText: "E-mail",
                        hintText: "Enter your e-mail",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!isValidEmail(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
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
                        obscureText: !_isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white.withOpacity(0.60),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword()));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            "Forget password?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB95DEE),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFFB95DEE),
                            ),
                          ),
                        ),
                      ),
                      ColoredButton(
                        buttonText: _isLoading ? "Logging in..." : "Login",
                        onTap: () {
                          if (!_isLoading) {
                            _login();
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: Row(
                          children: [
                            const Expanded(child: Divider(color: Color(0xFFA1A1A1), thickness: 1)),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Or", style: TextStyle(fontSize: 18, color: Color(0xFFA1A1A1))),
                            ),
                            const Expanded(child: Divider(color: Color(0xFFA1A1A1), thickness: 1)),
                          ],
                        ),
                      ),
                      login_signu_with(
                        logoImage: "assets/images/flat-color-icons_google.png",
                        buttonText: "Login with Google",
                        onTap: _signInWithGoogle,
                      ),
                      const SizedBox(height: 25),
                      const Center(
                        child: Text("Don't have an account?", style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                        },
                        child: const Center(
                          child: Text(
                            "Create account",
                            style: TextStyle(fontSize: 16, color: Color(0xFFB95DEE), decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
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
