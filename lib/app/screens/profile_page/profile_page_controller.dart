import 'package:demo_pro/app/routes/app_routes.dart';
import 'package:demo_pro/app/services/models/login_response/login_response.dart';
import 'package:demo_pro/app/services/repository/share_prefs_repo.dart';
import 'package:demo_pro/app/utils/utils.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePageController extends GetxController {
  SharPrefsRepo sharPrefsRepo=Get.find<SharPrefsRepo>();
  LoginResponse? loginResponse;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  getSaveLoginData() async {
    print("mytype ");
  UIData.showProgressDialog();
  LoginResponse? _loginResponse= await sharPrefsRepo.getLoginDetails();
  print("mytype ${_loginResponse?.toJson()}");
  if(_loginResponse != null){
    loginResponse=_loginResponse;
    update();
   } 
   UIData.hideProgressDialog();
  } 

  logOut(String? type) async {
    print("mytype $type");
   switch (type) {
     case 'simple':
       sharPrefsRepo.removeAll();
       return Get.offAllNamed(AppRoutes.login); 
     case 'google':
       sharPrefsRepo.removeAll();
       await _handleGoogleSignOut();
       return Get.offAllNamed(AppRoutes.login);
     case 'facebook':
       sharPrefsRepo.removeAll();
       await FacebookAuth.instance.logOut();
       return Get.offAllNamed(AppRoutes.login);  
   }
  }


  Future<void> _handleGoogleSignOut() => _googleSignIn.disconnect();

}