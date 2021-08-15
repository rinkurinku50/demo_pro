import 'package:demo_pro/app/routes/app_routes.dart';
import 'package:demo_pro/app/services/models/login_response/login_response.dart';
import 'package:demo_pro/app/services/repository/share_prefs_repo.dart';
import 'package:demo_pro/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';



class LoginController extends GetxController {
  SharPrefsRepo sharPrefsRepo=Get.find<SharPrefsRepo>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode passNode = FocusNode();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  

  GoogleSignIn _googleSignIn = GoogleSignIn();
  
  //for linkedIn
  final String redirectUrl = '--Redirect-Url';
  final String clientId = '--Client--ID';
  final String clientSecret = '--Client--Secret';
  //


  signinPressed() async {

  

    if (formState.currentState!.validate())  {
       LoginResponse loginResponse=LoginResponse(
         email: emailController.text,
         name: "Demo",
         imageUrl: Constants.DUMMYIMAGEURL,
         type: "simple"
       );
       await moveToPage(loginResponse);
    }
  } 

  faceBookLogin() async{
  final LoginResult result = await FacebookAuth.instance.login(
    permissions: ['public_profile', 'email']
  );
  if (result.status == LoginStatus.success) {
    final userData = await FacebookAuth.i.getUserData(
        fields: "name,email,picture.width(200),link",
    );
    print("login result ${userData}");
    LoginResponse loginResponse=LoginResponse(
         email: userData['email'] ?? "",
         name: userData['name'] ??"Demo",
         imageUrl:userData['picture']['data']['url'] ?? Constants.DUMMYIMAGEURL,
         type: "facebook"
       );
       await moveToPage(loginResponse);
 }
  } 

  //google

  Future<void> handleGoogleSignIn() async {
    try {
      GoogleSignInAccount? data =  await _googleSignIn.signIn();
      if(data != null){
       LoginResponse loginResponse=LoginResponse(
         email: data.email ?? "",
         name: data.displayName ?? "Demo",
         imageUrl:data.photoUrl ?? Constants.DUMMYIMAGEURL,
         type: "google"
       );
       await moveToPage(loginResponse); 
      }
    } catch (error) {
      print(error);
    }
  }
 

 moveToPage(LoginResponse loginResponse) async {
  await sharPrefsRepo.saveLoginDetails(loginResponse);
       return Get.offAllNamed(AppRoutes.main_page);
 }
  


}