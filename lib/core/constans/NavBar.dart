import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neuro_ninja/Child/childVR/presentation/view/VrChildScreen.dart';
import 'package:neuro_ninja/Teacher/teacherVR/presentation/view/vrChildList.dart';
import 'package:neuro_ninja/core/constans/appStyle.dart';
import 'package:neuro_ninja/feature/DoctorList/presentation/view/doctorList.dart';
import 'package:neuro_ninja/Teacher/TeacherHome/presentation/view/TeacherHome.dart';
import 'package:neuro_ninja/Child/childHome/presentation/view/ChildHome.dart';
import 'package:neuro_ninja/feature/Home/doctorHome/presentation/view/DoctorHome.dart';
import 'package:neuro_ninja/feature/chatBot/presentation/view/chatBot.dart';
import 'package:neuro_ninja/feature/headSetScreen/presentation/view/headSetWelcom.dart';
import 'package:neuro_ninja/feature/survy/presentation/view/welcomeSurvy.dart';


class BottomNavBar extends StatefulWidget {
  final String userRole;

  BottomNavBar({required this.userRole});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  List<Widget>? filteredScreens;
  List<Map<String, String>>? navIcons;

  Color selectedColor = const Color(0xFFF82FFA);
  Color unselectedColor = const Color(0xFFE6E6E6);

  @override
  void initState() {
    super.initState();

    // Filter screens and icons based on user role
    if (widget.userRole == 'Doctor') {
      filteredScreens = [HomeDoctor(), ChatBot(), VrChildList()];
      navIcons = [
        {'icon': 'assets/icons/home.svg'},
        {'icon': 'assets/icons/chatbot.svg'},
        {'icon': 'assets/icons/vrGlasses.svg'},
      ];
    } else if (widget.userRole == 'Teacher') {
      filteredScreens = [
        HomeTeacher(),WelcomeToSurvy(),    HeadSetWelcom(),
       ChatBot(), VrChildList(),  DoctorList(),];
      navIcons = [
        {'icon': 'assets/icons/home.svg'},
        {'icon': 'assets/icons/survey.svg'},
        {'icon': 'assets/icons/brain.svg'},
        {'icon': 'assets/icons/chatbot.svg'},
        {'icon': 'assets/icons/vrGlasses.svg'},
        {'icon': 'assets/icons/doctor.svg'},
      ];
    } else {
      filteredScreens = [
        HomeChild(),

        WelcomeToSurvy(),
        ChatBot(),
        VrChildScreen(),
        DoctorList(),
      ];
      navIcons = [
        {'icon': 'assets/icons/home.svg'},
        
        {'icon': 'assets/icons/survey.svg'},
        {'icon': 'assets/icons/chatbot.svg'},
        {'icon': 'assets/icons/vrGlasses.svg'},
        {'icon': 'assets/icons/doctor.svg'},
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (filteredScreens == null || navIcons == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Stack(
        children: filteredScreens!.asMap().entries.map((entry) {
          int index = entry.key;
          return Offstage(
            offstage: _currentIndex != index,
            child: Navigator(
              onGenerateRoute: (routeSettings) {
                return MaterialPageRoute(
                  builder: (context) => entry.value,
                );
              },
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(color: Color(0xFFADADAD), width: 1.5),
          ),
          gradient: LinearGradient(
            colors: AppStyle().navBarColor,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: navIcons!.map((iconData) {
            int index = navIcons!.indexOf(iconData);
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                iconData['icon']!,
                width: 30.w,
                height: 30.h,
                color: _currentIndex == index ? selectedColor : unselectedColor,
              ),
              label: '',
            );
          }).toList(),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
