import 'package:bang_pun_pay/invite_friends/invite_friends_controller.dart';
import 'package:get/get.dart';

class InviteFriendsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InviteFriendsController());
  }

}