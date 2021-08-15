import 'package:demo_pro/app/screens/dashboard_page/dashboard_page.dart';
import 'package:demo_pro/app/screens/main_page/main_page_controller.dart';
import 'package:demo_pro/app/screens/profile_page/profile_page.dart';
import 'package:demo_pro/app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPageController _mainPageController = Get.find<MainPageController>();

  // AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              elevation: 12.0,
              backgroundColor: Colors.white,
              onTap: _mainPageController.updateIndex,
              // selectedItemColor: AppColors.GREEN_COLOR,
              // unselectedItemColor: AppColors.UNSELECT_GREY_COLOR,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w800),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
              currentIndex: _mainPageController.currentIndex.value,
              items: [
                bottomNavigationItem("Home", 0),
                bottomNavigationItem("Package", 1),
                bottomNavigationItem("Chat", 2),
                bottomNavigationItem("Profile", 3)
              ])),
      body: Obx(() => IndexedStack(
            index: _mainPageController.currentIndex.value,
            children: [
             DashBoardPage(),
              Container(alignment: Alignment.center,child: Text("Package",style: TextStyle(color: AppColor.primaryColor)),),
              Container(alignment: Alignment.center,child: Text("Chat",style: TextStyle(color: AppColor.primaryColor)),),
             ProfilePage()
            ],
          )),
    );
  }

  bottomNavigationItem(String text, int pos) {
    return BottomNavigationBarItem(
      icon: pos == _mainPageController.currentIndex.value
          ? Icon(getIcon(pos), size: iconSize(), color: AppColor.primaryColor)
          : Icon(
              getIcon(pos),
              size: iconSize() - 3,
              color: Colors.black12,
            ),
      label: text,
    );
  }

  // lotiieeFile code

  // Lottie.asset(
  // 'assets/lottiefiles/home_icon.json',
  // height: iconSize(),
  // width: iconSize(),
  // controller: _controller,
  // onLoaded: (composition) {
  // // Configure the AnimationController with the duration of the
  // // Lottie file and start the animation.
  // _controller
  // ..duration = composition.duration
  // ..forward();
  // },
  // )

  getIcon(int pos) {
    switch (pos) {
      case 0:
        return Icons.home;
      case 1:
        return Icons.add_photo_alternate;

      case 2:
        return Icons.chat;

      case 3:
        return Icons.verified_user;
    }
  }

  openScreen() {
    switch (_mainPageController.currentIndex.value) {
      case 0:
        return DashBoardPage();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
    }
  }

  iconSize() {
    return ScreenUtil().radius(22);
  }
}
