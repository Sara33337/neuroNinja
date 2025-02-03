import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neuro_ninja/feature/notifications/presentation/view/notificationScreen.dart';

class appBar extends StatelessWidget {
  appBar(
      {super.key,
      this.firstIcons,
      this.secondIcons,
      this.showBackArrow = false,
      this.showChatIcon = false,
      this.showNotificationIcon = false});

  final IconButton? firstIcons;
  final IconButton? secondIcons;
  final bool showBackArrow;
  final bool showChatIcon;
  final bool showNotificationIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, top: 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 37.7.h,
                width: 88.w,
                child: Image(
                  image: AssetImage("assets/images/logo main.png"),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 150.w,
              ),
              if (showChatIcon) const chatIcon(),
              if (showNotificationIcon) const notificationIcon()
            ],
          ),
          if (showBackArrow) const BackArrow(),
        ],
      ),
    );
  }
}

class notificationIcon extends StatelessWidget {
  const notificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NotificationScreen();
          }));
        },
        icon: SvgPicture.asset(
          'assets/icons/bell-notification.svg',
          color: Colors.white,
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}

class chatIcon extends StatelessWidget {
  const chatIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/chat-circle.svg',
          color: Colors.white,
          width: 24.w,
          height: 24.h,
        ),
      ),
    );
  }
}

class BackArrow extends StatelessWidget {
  const BackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
    );
  }
}
