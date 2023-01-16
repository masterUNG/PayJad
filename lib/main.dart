import 'package:bang_pun_pay/home/home_binding.dart';
import 'package:bang_pun_pay/home/home_view.dart';
import 'package:bang_pun_pay/invite_friends/invite_friends_binding.dart';
import 'package:bang_pun_pay/invite_friends/invite_friends_view.dart';
import 'package:bang_pun_pay/member/member_binding.dart';
import 'package:bang_pun_pay/member/member_view.dart';
import 'package:bang_pun_pay/navigation/navigation_binding.dart';
import 'package:bang_pun_pay/notification/notification_binding.dart';
import 'package:bang_pun_pay/notification/notification_view.dart';
import 'package:bang_pun_pay/point_coupon/point_coupon_binding.dart';
import 'package:bang_pun_pay/profile/profile_binding.dart';
import 'package:bang_pun_pay/profile/profile_view.dart';
import 'package:bang_pun_pay/scan/scan_binding.dart';
import 'package:bang_pun_pay/scan/scan_view.dart';
import 'package:bang_pun_pay/store_detail/store_detail_binding.dart';
import 'package:bang_pun_pay/store_detail/store_detail_view.dart';
import 'package:bang_pun_pay/stores/stores_binding.dart';
import 'package:bang_pun_pay/stores/stores_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/colors.dart';
import 'navigation/navigation_view.dart';
import 'point_coupon/point_coupon_view.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NavigationView(),
      initialBinding: NavigationBinding(),
      theme: ThemeData(
        primaryColor: AppColors.blue,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 70,
          centerTitle: true,
        ),
        fontFamily: "Prompt",
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
          headline2: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          headline3: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          headline4: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          bodyText1: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),
          bodyText2: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
        ),
      ),

      // All pages
      getPages: [
        GetPage(
          name: "/",
          page: () => const NavigationView(),
          binding: NavigationBinding(),
        ),
        GetPage(
          name: "/home",
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/stores",
          page: () => const StoresView(),
          binding: StoresBinding(),
        ),
        GetPage(
          name: "/storeDetail",
          page: () => const StoreDetailView(),
          binding: StoreDetailBinding(),
        ),
        GetPage(
          name: "/pointCoupon",
          page: () => const PointCouponView(),
          binding: PointCouponBinding(),
        ),
        GetPage(
          name: "/inviteFriends",
          page: () => const InviteFriendsView(),
          binding: InviteFriendsBinding(),
        ),
        GetPage(
          name: "/notification",
          page: () => const NotificationView(),
          binding: NotificationBinding(),
        ),
        GetPage(
          name: "/scan",
          page: () => const ScanView(),
          binding: ScanBinding(),
        ),
        GetPage(
          name: "/member",
          page: () => const MemberView(),
          binding: MemberBinding(),
        ),
        GetPage(
          name: "/profile",
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
      ],
    )
  );
  
}