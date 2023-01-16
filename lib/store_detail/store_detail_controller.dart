import 'package:get/get.dart';

class StoreDetailController extends GetxController {

  final RxInt pageIndex = 0.obs;
  
  final String storesImgSrc = "assets/images/stores/";

  final Map<String, dynamic> storeDetail = {
    "name": "กำไร บิสโทร (Kamrai Bistro)",
    "image": ["stores1.png", "stores2.png", "stores3.png"],
    "rating": "4.5",
    "reviews": "45",
    "category": "คาเฟ่สเต๊กเครื่องดื่ม/น้ำผลไม้",
    "priceRate": "฿฿",
    "openTime": "10.00",
    "closeTime": "21.00",
    "closeDay": "หยุดทุกวันที่ 16",
    "shortLocation": "จ.พังงา",
    "location": "23/12 ม.2 ต.บางนายสี อ.ตะกั่วป่า จ.พังงา",
    "telephone": "095-4988-77861",
    "facebook": "xxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "mapImg": "map1.png"
  };

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

  List<Map<String, String>> interestStoresData = [];

  @override
  void onInit() {
    interestStoresData.addAll([store1, store2, store1]);
    super.onInit();
  }
}