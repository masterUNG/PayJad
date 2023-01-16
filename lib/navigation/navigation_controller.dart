import 'package:bang_pun_pay/member/member_view.dart';
import 'package:bang_pun_pay/notification/notification_view.dart';
import 'package:bang_pun_pay/scan/scan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';
import '../profile/profile_view.dart';

class NavigationController extends GetxController {

  // List of pages that show in the navigation page.
  final List<Widget> pages = const [
    HomeView(),
    NotificationView(),
    ScanView(),
    MemberView(),
    ProfileView()
  ];

  // Index of page that has selected to show.
  RxInt selectedIndex = 0.obs;

}