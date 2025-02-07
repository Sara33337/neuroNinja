import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuro_ninja/feature/splash/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NeuroNinja());
}

class NeuroNinja extends StatefulWidget {
  const NeuroNinja({super.key});

  @override
  _NeuroNinjaState createState() => _NeuroNinjaState();
}

class _NeuroNinjaState extends State<NeuroNinja> {
  @override
  void initState() {
    super.initState();
    
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('==================================================User is currently signed out!');
      } else {
        print('==================================================User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
