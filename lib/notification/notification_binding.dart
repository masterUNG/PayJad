import 'package:bang_pun_pay/notification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
  
}