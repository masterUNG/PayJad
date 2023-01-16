import 'package:bang_pun_pay/member/member_controller.dart';
import 'package:bang_pun_pay/notification/notification_controller.dart';
import 'package:bang_pun_pay/scan/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberController());
  }
  
}