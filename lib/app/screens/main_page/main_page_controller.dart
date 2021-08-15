import 'package:get/get.dart';

class MainPageController extends GetxController {

 var currentIndex = 0.obs;

  RxBool isReminderVolumn = false.obs ;

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  // TabController tabController;

  //   @override
  // void onInit() {
  //   super.onInit();
  //   // tabController = TabController(length: 2, vsync: this);
  // }

}