import 'package:bang_pun_pay/navigation/navigation_controller.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';
import '../member/member_controller.dart';
import '../notification/notification_controller.dart';
import '../profile/profile_controller.dart';
import '../scan/scan_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NotificationController());
    Get.lazyPut(() => ScanController());
    Get.lazyPut(() => MemberController());
    Get.lazyPut(() => ProfileController());
  }
  
}