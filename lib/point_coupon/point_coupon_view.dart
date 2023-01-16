import 'package:bang_pun_pay/point_coupon/point_coupon_controller.dart';
import 'package:bang_pun_pay/widgets/pages_divide.dart';
import 'package:bang_pun_pay/widgets/reuse_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/gradient_appbar.dart';

class PointCouponView extends GetView<PointCouponController> {
  const PointCouponView({super.key});

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
          "Points แลกคูปอง",
          style: Theme.of(context).textTheme.headline1!.apply(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: PagesDivide(
          labels: const [
            "Points",
            "Partner",
          ],
          children: [
            getPointsPage(context),
            getPartnerPage(context),
          ],
        ),
      )
    );
  }
  
  Widget getPointsPage(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      itemCount: controller.couponsImg.length,
      itemBuilder: (context, index) {
        return ReUseCard(
          margin: const EdgeInsets.only(bottom: 10),
          borderRadius: BorderRadius.circular(20),
          child: Image(
            image: AssetImage(controller.couponImgSrc + controller.couponsImg[index]),
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
  
  Widget getPartnerPage(BuildContext context) {
    return Center(
      child: Text(
        "Partner page",
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
  
}