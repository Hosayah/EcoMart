import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;


  /// Update current index when page scrolls
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specified page when dot is selected
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  /// Update current index and jump to next page
  void nextPage() async {
    if(currentPageIndex.value==2){
      final storage = GetStorage();

      if (kDebugMode) {
        print('========================= GET STORAGE ===========================');
        print(storage.read('isFirstTime'));
      }
      storage.write('isFirstTime', false);

      // ✅ Wait a moment (for debug purposes)
      await Future.delayed(Duration(milliseconds: 100));

      if (kDebugMode) {
        print('After write: ${storage.read('isFirstTime')}');
      }

      Get.offAll(() => LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  /// Update current index and jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}

