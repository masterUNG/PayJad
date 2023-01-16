import 'package:bang_pun_pay/constants/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final PageController pageViewCtr = PageController();
  final ScrollController mainScrollCtr = ScrollController();

  final String imagesSrc = "assets/images/";
  
  RxInt pageIndex = 0.obs;

  final String newsImgSrc = "news/";
  final List<String> newsImg = [
    "news.png",
    "news.png",
    "news.png"
  ];

  final int points = 2500;
  final int coupons = 16;

  NumberFormat numFormat = NumberFormat.decimalPattern('en_us');
  String get pointNum => numFormat.format(points);
  String get couponNum => numFormat.format(coupons);


  final String buttonPicSrc = "button/";
  final String buttonVip = "vip_btn.png";

  final String partnerPicSrc = "partner/";
  final List<Map<String, String>> partnerPics = [
    {
      "name": "Shoppee",
      "src": "shoppee.png"
    },
    {
      "name": "Lazada",
      "src": "lazada.png"
    },
    {
      "name": "PTT Station",
      "src": "ptt_station.png"
    },
    {
      "name": "McDonald's",
      "src": "mc_donald.png"
    },
    {
      "name": "Dairy Queen",
      "src": "dairy_queen.png"
    }
  ];

  final String promotionPicSrc = "promotion/";
  final List<String> promotionPics = [
    "promotion.png",
    "promotion.png",
    "promotion.png"
  ];

  final String coinSharingPicSrc = "coin_sharing/";
  final List<Map<String, String>> coinSharingData = [
    {
      "title": "XXXXXXXXXXXX",
      "description": "ลด 100 บาท เมื่อซื้อครบ 700 บาท",
      "picSrc": "kfc_sharing1.png"
    },
    {
      "title": "XXXXXXXXXXXX",
      "description": "ลด 100 บาท เมื่อซื้อครบ 700 บาท",
      "picSrc": "kfc_sharing2.png"
    },
    {
      "title": "XXXXXXXXXXXX",
      "description": "ลด 100 บาท เมื่อซื้อครบ 700 บาท",
      "picSrc": "dairy_queen_sharing.png"
    },
    {
      "title": "XXXXXXXXXXXX",
      "description": "ลด 100 บาท เมื่อซื้อครบ 700 บาท",
      "picSrc": "dairy_queen_sharing.png"
    }
  ];

  final List<String> sharingIcon = [
    AppIcons.line,
    AppIcons.messenger,
    AppIcons.facebook,
    AppIcons.twitter,
    AppIcons.whatsapp,
    AppIcons.share,
    AppIcons.more,
  ];

  RxDouble scrollHeight = 0.0.obs;

  @override
  void onInit() {
    mainScrollCtr.addListener(_mainScrollListener);
    super.onInit();
  }

  // Get height of ListView scrolling
  _mainScrollListener() {
    scrollHeight.value = mainScrollCtr.offset;
  }

  void gotoPointCouponPage() {
    Get.toNamed("/pointCoupon");
  }

  void gotoStoresPage() {
    Get.toNamed("/stores");
  }

}