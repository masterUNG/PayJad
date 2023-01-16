import 'package:bang_pun_pay/constants/icons.dart';
import 'package:bang_pun_pay/store_detail/store_detail_controller.dart';
import 'package:bang_pun_pay/widgets/reuse_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../stores/stores_view.dart';
import '../widgets/gradient_appbar.dart';
import '../widgets/slide_menu.dart';

class StoreDetailView extends GetView<StoreDetailController> {
  const StoreDetailView({super.key});

  final double bottomPadding = 10;

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
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          // Store image in page view
          SizedBox(
            height: 220,
            child: Stack(
              children: [
                PageView.builder(
                  onPageChanged: (value) => controller.pageIndex.value = value,
                  itemCount:  controller.storeDetail["image"]!.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      controller.storesImgSrc + controller.storeDetail["image"][index]!,
                      fit: BoxFit.cover,
                    );
                  },
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 50,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.storeDetail["image"]!.length,
                        (index) => getIndicator(controller.pageIndex.value == index)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 15
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getStoreNameModule(context),
                getLocationRatingModule(context),
                getCategoryPriceRateModule(context),
          
                getOpenStatusModule(context),
                const SizedBox(height: 5),
                getDivider(),
          
                getContactModule(context),
                getMapModule(context),
                getInterestStore(context),
          
              ],
            ),
          )
        ],
      ),
    );
  }

  // Animation indicator for pageView.
  Widget getIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: (isActive? 30.0 : 8.0),
      decoration: BoxDecoration(
        color: isActive? AppColors.darkGrey : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  // Bottom padding for widgets
  Widget getBottomPadding({required Widget child}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: child,
    );
  }
  
  // Grey Divider
  Widget getDivider() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 15
      ),
      child: Container(
        color: AppColors.lightGrey,
        height: 1,
      ),
    );
  }

  Widget getModuleHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
  
  Widget getStoreNameModule(BuildContext context) {
    return getBottomPadding(
      child: Text( 
        controller.storeDetail["name"]!,
        style: Theme.of(context).textTheme.headline2,
      )
    );
  }
  
  // Short location, rating and reviews number of store
  Widget getLocationRatingModule(BuildContext context) {
    return getBottomPadding(
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.place_outlined,
                  color: AppColors.blue,
                ),
                SizedBox(width: 5),
                Text(
                  controller.storeDetail["shortLocation"]!,
                  style: Theme.of(context).textTheme.bodyText1!.apply(
                    color: AppColors.blue
                  ),
                )
              ],
            ),
          ),
              
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.darkYellow,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Text(
                  controller.storeDetail["rating"]!,
                  style: Theme.of(context).textTheme.bodyText1!.apply(color: Colors.white),
                ),
                SizedBox(width: 5),
                const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            )
          ),
      
          SizedBox(width: 15),
              
          Text(
            "${controller.storeDetail["reviews"]!} รีวิว",
            style: Theme.of(context).textTheme.bodyText1!.apply(color: AppColors.blue),
          ),
        ],
      ),
    );
  }
  
  // Category and price rate of store
  Widget getCategoryPriceRateModule(BuildContext context) {
    return getBottomPadding(
      child: Text(
        "${controller.storeDetail["category"]!} ${controller.storeDetail["priceRate"]!}",
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
  
  // Open status (Open or Close), close time and share
  Widget getOpenStatusModule(BuildContext context) {
    final int now = DateTime.now().hour;
    final String closeTime = controller.storeDetail["closeTime"]!;
    final bool isOpen = now < int.parse(closeTime.substring(0, 2));
    return getBottomPadding(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: isOpen? AppColors.green : Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              isOpen? "เปิดอยู่" : "ปิดอยู่",
              style: Theme.of(context).textTheme.bodyText1!.apply(color: Colors.white),
            ),
          ),

          const SizedBox(width: 10),

          // Close time
          Expanded(
            child: Text(
              "จนถึง $closeTime",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),

          // Share
          Text(
            "แชร์",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.send_outlined,
            size: 20,
          ),
        ],
      ),
    );
  }

  // Contact template for using in contact module
  Widget contactTemplate(BuildContext context, Widget child, String detail) {
    return Column(
      children: [
        Row(
          children: [
            child,
            SizedBox(width: 15),
            Expanded(
              child: Text(
                detail,
                // Set height to 0.8 for reducing line space
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  height: 0.8,
                )
              ),
            ),
          ],
        ),
        getDivider()
      ],
    );
  }
  
  // For Icons class
  Widget contactTemplateIcons(BuildContext context, IconData icon, String detail) {
    return contactTemplate(
      context,
      CircleAvatar(
        backgroundColor: AppColors.lightestBlue,
        child: Icon(
          icon,
          color: AppColors.blue,
        ),
      ),
      detail
    );
  }

  // For AppIcons class
  Widget contactTemplateAppIcons(BuildContext context, String icon, String detail) {
    return contactTemplate(
      context,
      CircleAvatar(
        backgroundColor: AppColors.lightestBlue,
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            AppIcons.src + icon,
            fit: BoxFit.contain,
          ),
        ),
      ),
      detail
    );
  }
  
  Widget getContactModule(BuildContext context) {
    final Map<String, dynamic> storeData = controller.storeDetail;
    return getBottomPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getModuleHeader(context, "ช่องทางการติดต่อ"),

          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              contactTemplateIcons(
                context, 
                Icons.schedule_outlined, 
                """เวลาเปิด ${storeData["openTime"]!}-${storeData["closeTime"]!} น. 
                \nวันหยุดทำการ ${storeData["closeDay"]}"""
              ),
              contactTemplateIcons(context, Icons.place_outlined, storeData["location"]!),
              contactTemplateIcons(context, Icons.call_outlined, storeData["telephone"]!),
              contactTemplateAppIcons(context, AppIcons.facebook, storeData["facebook"]!),
            ],
          )
        ],
      ),
    );
  }
  
  Widget getMapModule(BuildContext context) {
    return getBottomPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getModuleHeader(context, "แผนที่ร้านค้า"),
          ReUseCard(
            margin: null,
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              controller.storesImgSrc + controller.storeDetail["mapImg"]!, 
              fit: BoxFit.contain
            ),
          )
        ],
      )
    );
  }
  
  Widget getInterestStore(BuildContext context) {
    return getBottomPadding(
      child: SlideMenu(
        height: 160,
        label: "ร้านที่คุณสนใจ",
        hasSeeMore: false,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.interestStoresData.length,
          itemBuilder: (context, index) {
            return StoresView.getStoreCard(
              context, 
              controller.storesImgSrc + controller.interestStoresData[index]["image"]!, 
              controller.interestStoresData[index]["name"]!, 
              controller.interestStoresData[index]["location"]!,
              () {}
            );
          },
        ),
      )
    );
  }

}