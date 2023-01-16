import 'dart:ffi';

import 'package:bang_pun_pay/constants/colors.dart';
import 'package:bang_pun_pay/constants/icons.dart';
import 'package:bang_pun_pay/home/home_controller.dart';
import 'package:bang_pun_pay/main.dart';
import 'package:bang_pun_pay/widgets/news_pageview.dart';
import 'package:bang_pun_pay/widgets/reuse_card.dart';
import 'package:bang_pun_pay/widgets/slide_menu.dart';
import 'package:bang_pun_pay/widgets/vip_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/background_painter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Center(
        // Use Obx for statefull widget (getx package)
        child: Obx(
          // Paint a curve background
          () => CustomPaint(
            painter: BackgroundPainter(height: controller.scrollHeight.value),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              controller: controller.mainScrollCtr,
              children: [
                getLogoModule(context),
                const NewsPageView(),
                getPointCouponModule(context),
                const VipButton(),
                getMultiMenuModule(context),
                getSlidePartnerModule(context, "Partner ที่เข้าร่วม", 60),
                getSlidePromotionModule(context, "โปรโมชั่นแนะนำ", 120),
                getSlideStoresModule(context, "ร้านค้าแนะนำ", 120),
                getCoinSharingModule(context),
                getShareFriendsCardModule(context),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      )
    );
  }

  // Logo module
  Widget getLogoModule(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Column(
        children: [
          // Push the logo to the bottom of SizedBox.
          const Expanded(
            child: SizedBox(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                maxRadius: 24,
                backgroundColor: Colors.white,
                child: Image(
                  image: AssetImage("assets/images/logo/logo.png"),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "BangPun Pay",
                style: Theme.of(context).textTheme.headline1!.apply(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  // Icon with text that show in Point and Coupon card
  Widget getIconWithText(BuildContext context, String icon, List<String> text) {
    double iconSize = 35;
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              color: AppColors.lightestBlue,
              borderRadius: BorderRadius.circular(5.0)
            ),
            child: Image(
              image: AssetImage(AppIcons.src + icon)
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text[0],
                style: Theme.of(context).textTheme.bodyText1,
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    TextSpan(
                      text: text[1],
                      style: TextStyle(
                        color: AppColors.blue,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    const TextSpan(text: " "),
                    TextSpan(text: text[2]),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // Point and Coupon card
  Widget getPointCouponModule(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.gotoPointCouponPage(),
      child: ReUseCard(
        padding: const EdgeInsets.symmetric(
          vertical: 1.5, 
          horizontal: 2
        ),
        borderRadius: BorderRadius.circular(12),
        height: 70,
        // Border gradient
        gradient: LinearGradient(
          colors: [AppColors.blue, AppColors.lightBlue],
          stops: const [0.2, 1],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // For showing points
              getIconWithText(
                context, 
                AppIcons.point, 
                ["Point (บาท)", controller.pointNum.toString(), "คะแนน"]
              ),

              Container(
                color: AppColors.blue, 
                width: 1, 
                height: 45
              ),

              // For showing coupons
              getIconWithText(
                context, 
                AppIcons.coupon, 
                ["คูปอง", controller.couponNum.toString(), "คูปอง"]
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Icon with label that show in Multi menus module
  Widget getIconLabelButton(BuildContext context, 
  {
    required String iconName, 
    required String label, 
    void Function()? func
  }) {
    return GestureDetector(
      onTap: func,
      child: SizedBox(
        width: 75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 55,
              decoration: BoxDecoration(
                color: AppColors.lightestBlue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image(
                image: AssetImage(AppIcons.src + iconName),
                width: 30,
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }

  // Multi menus
  Widget getMultiMenuModule(BuildContext context) {
    return ReUseCard(
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // First line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getIconLabelButton(
                  context, 
                  iconName: AppIcons.marketplace, 
                  label: "BangPun Marketplace"
                ),
                getIconLabelButton(context, iconName: AppIcons.hotel, label: "ที่พัก/โรงแรม"),
                getIconLabelButton(context, iconName: AppIcons.spa, label: "สปา"),
                getIconLabelButton(context, iconName: AppIcons.bill, label: "จ่ายบิล"),
              ],
            ),

            const SizedBox(height: 10),

            // Second line
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getIconLabelButton(context, iconName: AppIcons.ticket, label: "ตั๋วหนัง"),
                getIconLabelButton(context, iconName: AppIcons.hotDeal, label: "Hot Deal"),
                getIconLabelButton(
                  context, 
                  iconName: AppIcons.nearlyStore, 
                  label: "ร้านค้าใกล้คุณ", 
                  func: () => controller.gotoStoresPage()
                ),
                getIconLabelButton(context, iconName: AppIcons.allServices, label: "บริการทั้งหมด"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Show Partners
  Widget getSlidePartnerModule(BuildContext context, String label, double height) {
    return SlideMenu(
      label: label,
      height: height,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.partnerPics.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 5),
            width: height + 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Blue Circle
                Container(
                  width: height,
                  height: height,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  // Put an image
                  // child: Image(
                  //   image: AssetImage(
                  //     controller.imagesSrc + controller.restaurantPicSrc + controller.restaurantPics[index]["src"]!
                  //   ),
                  //   fit: BoxFit.contain,
                  // ),
                ),

                Text(
                  controller.partnerPics[index]["name"]!,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  
  // Show Promotions
  Widget getSlidePromotionModule(BuildContext context, String label, double height) {
    return SlideMenu(
      label: label,
      height: height,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.promotionPics.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(right: 20.0),
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image(
              image: AssetImage(
                controller.imagesSrc + controller.promotionPicSrc + controller.promotionPics[index]
              ),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
  
  // Show Stores
  Widget getSlideStoresModule(BuildContext context, String label, double height) {
    return SlideMenu(
      label: label,
      height: height,
      func: () => controller.gotoStoresPage(),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.promotionPics.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(right: 20),
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image(
              image: AssetImage(
                controller.imagesSrc + controller.promotionPicSrc + controller.promotionPics[index]
              ),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  // Show Coin Sharing
  Widget getCoinSharingModule(BuildContext context) {
    int listLength = controller.coinSharingData.length;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          SlideMenu.getModuleHeader(context, label: "สินค้าแบ่งปัน Coin", hasSeeMore: true),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 555,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
              ),
              itemCount: (listLength >= 4)? 4 : listLength,
              itemBuilder: (context, index) =>
                getEachCoinSharing(context, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget getEachCoinSharing(BuildContext context, int index) {
    Map<String, String> data = controller.coinSharingData[index];
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(
              controller.imagesSrc + controller.coinSharingPicSrc + data["picSrc"]!
            ),
            fit: BoxFit.cover,
          ),
      
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["title"]!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    data["description"]!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
              left: 15,
              right: 15,
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(0.0),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      color: AppColors.blue,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "สั่งซื้อสินค้า",
                    style: Theme.of(context).textTheme.headline4!.apply(color: AppColors.blue),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Show Share
  Widget getShareFriendsCardModule(BuildContext context) {
    return ReUseCard(
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "กดแชร์กับเพื่อน รับ 100 คะแนน",
              style: Theme.of(context).textTheme.headline3,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.sharingIcon.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 35,
                      height: 35,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: AppColors.lightestBlue,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Image(
                        image: AssetImage(AppIcons.src + controller.sharingIcon[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

}