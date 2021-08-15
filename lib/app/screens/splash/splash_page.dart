import 'package:demo_pro/app/screens/splash/splash_controller.dart';
import 'package:demo_pro/app/widgets/custom_gra_backdround.dart';
import 'package:demo_pro/app/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
 SplashController splashController=Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: splashController,
          initState: (state) {
            splashController.checkSignIn();
          },
          builder: (logic) {
        return BackgroundWidget(child: Center(
          child: TitleWidget(isHome: true,),
        ));
      }),
    );
  }
}
