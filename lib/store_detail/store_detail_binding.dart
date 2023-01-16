import 'package:bang_pun_pay/store_detail/store_detail_controller.dart';
import 'package:get/get.dart';

class StoreDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreDetailController());
  }

}