import 'package:bang_pun_pay/constants/colors.dart';
import 'package:bang_pun_pay/stores/stores_controller.dart';
import 'package:bang_pun_pay/widgets/news_pageview.dart';
import 'package:bang_pun_pay/widgets/reuse_card.dart';
import 'package:bang_pun_pay/widgets/slide_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/gradient_appbar.dart';

class StoresView extends GetView<StoresController> {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        flexibleSpace: const GradientAppbar(),
        title: Text(
          "ร้านอาหาร",
          style: Theme.of(context).textTheme.headline1!.apply(color: Colors.white),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          const NewsPageView(),

          getSearchDescription(context),
          getSearchBar(context),

          getPopularStoresModule(context),
          getHotStoresModule(context),
          getLocatedStoresModule(context),
        ],
      ),
    );
  }

  // Search description that show over search bar
  Widget getSearchDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 40,
      ),
      child: Column(
        children: [
          Text(
            "ค้นหาร้านพิกัดคุ้ม",
            style: Theme.of(context).textTheme.headline2,
            ),
          Text(
            "บริการค้นหาร้านที่จ่ายสบายผ่าน QR Code หรือ Payment Link ด้วย BangPun Pay",
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget getSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.lightGrey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.blue, width: 1),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                  labelText: "ค้นหาชื่อร้าน...",
                ),
              ),
            ),
          ),
    
          const SizedBox(width: 10),
    
          ReUseCard(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8
            ),
            margin: const EdgeInsets.all(0),
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.lightGrey, width: 1),
            child: const Icon(Icons.tune_outlined),
          )
        ],
      ),
    );
  }

  // Card of store (Image, name and location)
  static Widget getStoreCard(BuildContext context, String imageSrc, String name, String location, Function()? func) {
    return GestureDetector(
      onTap: func,
      child: ReUseCard(
        margin: const EdgeInsets.only(
          bottom: 5,
          right: 20
        ),
        borderRadius: BorderRadius.circular(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageSrc),
              fit: BoxFit.cover,
            ),
      
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        color: AppColors.blue,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        location,
                        style: Theme.of(context).textTheme.bodyText1!.apply(
                          color: AppColors.blue
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Popular stores slide menu
  Widget getPopularStoresModule(BuildContext context) {
    return SlideMenu(
      height: 160,
      label: "ร้านค้าขายดี",
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.popularStoresData.length,
        itemBuilder: (context, index) {
          return getStoreCard(
            context, 
            controller.storesImgSrc + controller.popularStoresData[index]["image"]!, 
            controller.popularStoresData[index]["name"]!, 
            controller.popularStoresData[index]["location"]!,
            () => controller.gotoStoreDetailPage()
          );
        },
      ),
    );
  }

  // Hot stores slide menu
  Widget getHotStoresModule(BuildContext context) {
    return SlideMenu(
      height: 550,
      label: "ร้านฮิต ติดเทรนด์",
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 1,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: controller.hotStoresData.length,
        itemBuilder: (context, index) {
          return getStoreCard(
            context, 
            controller.storesImgSrc + controller.hotStoresData[index]["image"]!, 
            controller.hotStoresData[index]["name"]!, 
            controller.hotStoresData[index]["location"]!,
            () => controller.gotoStoreDetailPage()
          );
        },
      ),
    );
  }

  // "ร้านปุกหมุดสุดฟิน" Slide menu
  Widget getLocatedStoresModule(BuildContext context) {
    return SlideMenu(
      height: 160,
      label: "ร้านปักหมุดสุดฟิน",
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.locatedStoresData.length,
        itemBuilder: (context, index) {
          return getStoreCard(
            context, 
            controller.storesImgSrc + controller.locatedStoresData[index]["image"]!, 
            controller.locatedStoresData[index]["name"]!, 
            controller.locatedStoresData[index]["location"]!,
            () => controller.gotoStoreDetailPage()
          );
        },
      ),
    );
  }
  
}