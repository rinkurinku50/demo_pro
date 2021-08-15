import 'package:demo_pro/app/routes/app_routes.dart';
import 'package:demo_pro/app/screens/login_page/demo_tezt.dart';
import 'package:demo_pro/app/screens/login_page/login_controller.dart';
import 'package:demo_pro/app/utils/theme/app_colors.dart';
import 'package:demo_pro/app/utils/validators.dart';
import 'package:demo_pro/app/widgets/bezier_container.dart';
import 'package:demo_pro/app/widgets/custom_text_field.dart';
import 'package:demo_pro/app/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:linkedin_login/linkedin_login.dart';

class LoginPage extends StatelessWidget with Validators {
  LoginController loginController = Get.find<LoginController>();

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        return loginController.signinPressed();
      },
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColor.primaryColor, AppColor.accentColor])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: loginController.formState,
      child: Column(
        children: <Widget>[
          CustomTextField(
            "Email id",
            controller: loginController.emailController,
            validator: (val) {
              return validateEmailForm(val);
            },
          ),
          CustomTextField("Password",
              isPassword: true,
              controller: loginController.passController,
              validator: (val) => validatePassword(val)),
        ],
      ),
    );
  }

  _socialButtons() {
    return Container(
      child: Column(
        children: [
          SignInButton(
            Buttons.Google,
            onPressed: () {
              loginController.handleGoogleSignIn();
            },
          ),
          SignInButton(
            Buttons.Facebook,
            onPressed: () {
              loginController.faceBookLogin();
            },
          ),
          SignInButton(
            Buttons.LinkedIn,
            onPressed: () {
              return Get.to(LinkedInAuthCodeWidget(
                onGetAuthCode: (data) {},
                appBar: AppBar(),
                redirectUrl: loginController.redirectUrl,
                clientId: loginController.clientId,
                onError: (error) {},
              ));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = 1.sh;
    return Scaffold(
        body: GetBuilder(
            init: loginController,
            builder: (logic) {
              return Container(
                height: height,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: -height * .15,
                        right: -1.sw * .4,
                        child: BezierContainer()),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: height * .2),
                            TitleWidget(),
                            SizedBox(height: 45.h),
                            _emailPasswordWidget(),
                            SizedBox(height: 18.h),
                            _submitButton(),
                            SizedBox(height: 18.h),
                            _socialButtons()
                          ],
                        ),
                      ),
                    ),
                    // Positioned(top: 35.h, left: 0, child: _backButton()),
                  ],
                ),
              );
            }));
  }
}
