import 'package:bang_pun_pay/stores/stores_controller.dart';
import 'package:get/get.dart';

class StoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoresController());
  }

}