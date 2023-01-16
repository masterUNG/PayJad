import 'package:get/get.dart';

class MemberController extends GetxController {

  final String imagesSrc = "assets/images/";

  final String backgroundSrc = "assets/images/background/"; 
  final String profileBackground = "profile_background.png";

  final String userImgSrc = "assets/images/users/";
  final Map<String, String> userData = {
      "name": "ธราธิป ณ บางช้าง",
      "image": "men.png",
      "badge": "BangPunPay PLATINUM",
      "points": "2,500",
      "expiring_points": "0"
  };

  final String benefitImgSrc = "promotion/";
  final List<String> benefitImgs = [
    "promotion.png",
    "promotion.png",
    "promotion.png"
  ];
}