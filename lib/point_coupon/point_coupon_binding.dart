import 'package:bang_pun_pay/point_coupon/point_coupon_controller.dart';
import 'package:get/get.dart';

class PointCouponBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PointCouponController());
  }

}