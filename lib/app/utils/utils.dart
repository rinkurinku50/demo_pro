import 'package:demo_pro/app/widgets/progress_dialog.dart';
import 'package:get/get.dart';

class UIData{

   


  static showProgressDialog(){
   return Get.dialog(ProgressDialogFullScreen());
  }


static hideProgressDialog(){
   return Get.back();
  }

}