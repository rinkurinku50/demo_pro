import 'dart:convert';

import 'package:demo_pro/app/services/models/login_response/login_response.dart';
import 'package:demo_pro/app/services/provider/share_prefs_provider.dart';
import 'package:demo_pro/app/utils/constants.dart';
import 'package:get/get.dart';

class SharPrefsRepo {
  SharPrefsProvider _sharPrefsProvider = Get.find<SharPrefsProvider>();

  // for login
  saveLoginDetails(LoginResponse response) {
    String data = json.encode(response);
    _sharPrefsProvider.setValue(Constants.LOGIN_DETAILS, data);
  }

  Future<LoginResponse?> getLoginDetails() async {
    String? str = await _sharPrefsProvider.getValue(Constants.LOGIN_DETAILS);
    LoginResponse? loginResponse;

    if (str != null) {
      loginResponse = LoginResponse.fromJson(json.decode(str));
      return loginResponse;
    }
    return loginResponse;
  }
  ///

  


  Future<void> setValue(String key, dynamic value) =>
      _sharPrefsProvider.setValue(key, value);

  Future<dynamic> getValue(String key) => _sharPrefsProvider.getValue(key);

  Future<void> removeValue(String key) => _sharPrefsProvider.removeValue(key);

  Future<void> setValueIfNull(String key, dynamic value) =>
      _sharPrefsProvider.setValueIfNull(key, value);

  Future<bool> checkHasData(String key) => _sharPrefsProvider.checkHasData(key);

  Future<void> removeAll() => _sharPrefsProvider.removeAll();
}