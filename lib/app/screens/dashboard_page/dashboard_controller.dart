import 'package:demo_pro/app/services/models/unsplash_response/unsplash_response.dart';
import 'package:demo_pro/app/services/provider/api_provider.dart';
import 'package:demo_pro/app/utils/utils.dart';
import 'package:demo_pro/app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DioObject; 
class DashBoardController extends GetxController {
  ApiProvider apiRepo=Get.find<ApiProvider>(); 
  List<UnSplashResposne> listUnsplashRes=[]; 
   
  @override
  void onInit() {
    super.onInit();
  }

  fetchImages() async {
    
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) { 
      UIData.showProgressDialog();
    });
   try {
      DioObject.Response response = await apiRepo
          .getUnSplashData();
      UIData.hideProgressDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data.length > 0) {
            for (var item in response.data) {
              listUnsplashRes.add(UnSplashResposne.fromJson(item));
              update();
            }
           
          
        } else {
          
         print("error Data not found");
          // customToast(errorResponse.message);
        }
      } else {
          
         print("error ${response.data}");
          // customToast(errorResponse.message);
        }
    } catch  (error) {
      UIData.hideProgressDialog();
      print("error $error");

    }
  }

  

}