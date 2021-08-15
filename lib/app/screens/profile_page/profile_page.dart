import 'package:demo_pro/app/screens/profile_page/profile_page_controller.dart';
import 'package:demo_pro/app/utils/constants.dart';
import 'package:demo_pro/app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePageController _profilePageController =
      Get.find<ProfilePageController>();

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return GetBuilder(
      init: _profilePageController,
      initState: (_) {
       
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          _profilePageController.getSaveLoginData();
         });
      },
      builder: (_) {
        return SafeArea(
          top: true,
          child: Container(
            // color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.primaryColor,
                        radius: 38.r,
                        backgroundImage: NetworkImage(_profilePageController.loginResponse?.imageUrl ?? Constants.DUMMYIMAGEURL),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           _profilePageController.loginResponse?.name ?? "Demo",
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                           _profilePageController.loginResponse?.email ?? "",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: ElevatedButton(
                    
                    onPressed: () {
                     _profilePageController.logOut(_profilePageController.loginResponse?.type);
                  }, child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 12.0.h),
                    child: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600
                                  ),
                            ),
                  ),),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
