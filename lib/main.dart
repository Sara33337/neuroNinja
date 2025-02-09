
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/feature/splash/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider("your-site-key"),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );

  runApp(const NeuroNinja());
}

class NeuroNinja extends StatefulWidget {
  const NeuroNinja({super.key});

  @override
  _NeuroNinjaState createState() => _NeuroNinjaState();
}

class _NeuroNinjaState extends State<NeuroNinja> {
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: 
          
          SplashScreen(),
        );
      },
    );
  }
}