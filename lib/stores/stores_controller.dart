import 'package:get/get.dart';

class StoresController extends GetxController {

  final String storesImgSrc = "assets/images/stores/";

  final Map<String, String> store1 = {
    "name": "กำไร บิสโทร",
    "image": "stores1.png",
    "location": "จ.พังงา"
  };
  final Map<String, String> store2 = {
    "name": "กำไร บิสโทร",
    "image": "stores2.png",
    "location": "จ.พังงา"
  };
  final Map<String, String> store3 = {
    "name": "กำไร บิสโทร",
    "image": "stores3.png",
    "location": "จ.พังงา"
  };
  final Map<String, String> store4 = {
    "name": "กำไร บิสโทร",
    "image": "stores4.png",
    "location": "จ.พังงา"
  };
  final Map<String, String> store5 = {
    "name": "กำไร บิสโทร",
    "image": "stores5.png",
    "location": "จ.พังงา"
  };
  final Map<String, String> store6 = {
    "name": "กำไร บิสโทร",
    "image": "stores6.png",
    "location": "จ.พังงา"
  };
  final Map<String, String> store7 = {
    "name": "กำไร บิสโทร",
    "image": "stores7.png",
    "location": "จ.พังงา"
  };
  final Map<String, String> store8 = {
    "name": "กำไร บิสโทร",
    "image": "stores8.png",
    "location": "จ.พังงา"
  };
  final Map<String, String> store9 = {
    "name": "กำไร บิสโทร",
    "image": "stores9.png",
    "location": "จ.พังงา"
  };

  List<Map<String, String>> popularStoresData = [];
  List<Map<String, String>> hotStoresData = [];
  List<Map<String, String>> locatedStoresData = [];

  @override
  void onInit() {
    popularStoresData.addAll([store1, store2, store1]);
    hotStoresData.addAll([
      store3, store4, store5, store1, store6, store7, store3, store4, store5, store1, store6, store7
    ]);
    locatedStoresData.addAll([store8, store9, store9]);

    super.onInit();
  }

  void gotoStoreDetailPage() {
    Get.toNamed("/storeDetail");
  }
}