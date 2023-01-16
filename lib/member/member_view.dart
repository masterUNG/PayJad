import 'package:bang_pun_pay/constants/colors.dart';
import 'package:bang_pun_pay/member/member_controller.dart';
import 'package:bang_pun_pay/widgets/reuse_card.dart';
import 'package:bang_pun_pay/widgets/slide_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MemberView extends GetView<MemberController> {
  const MemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 24
        ),
        physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          getUserDataModule(context),
          getMemberGroupModule(context),
          getBenefitModule(context),
          getPromotionModule(context),
          const SizedBox(height:  100),
        ],
      )
    );
  }
  
  // User detail card (name, profile picture, member level and points)
  Widget getUserDataModule(BuildContext context) {
    return ReUseCard(
      padding: const EdgeInsets.only(bottom: 20),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        children: [
          Stack(
            children: [
              // Blue background
              Image(
                image: AssetImage(controller.backgroundSrc + controller.profileBackground),
              ),

              // Name, member level and profile picture
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.userData["name"]!,
                          style: Theme.of(context).textTheme.headline1!.apply(color: Colors.white),
                        ),

                        const SizedBox(height: 10),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical:  2.0,
                            horizontal:  12.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            controller.userData["badge"]!,
                            style: Theme.of(context).textTheme.bodyText1!.apply(color: AppColors.blue),
                          ),
                        )
                      ],
                    ),

                    Container(
                      height:  80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image(
                        image: AssetImage(controller.userImgSrc + controller.userData["image"]!),
                        fit: BoxFit.contain,
                      )
                    ),
                  ],
                ),
              )
            ],
          ),

          const SizedBox(height: 20),

          // Showing user points
          Text(
            "Points ของคุณ",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            controller.userData["points"]!,
            style: Theme.of(context).textTheme.headline1!.apply(color: AppColors.blue),
          ),
          Text(
            "${controller.userData["expiring_points"]!} คะแนนจะหมดอายุใน 31 ต.ค. 2022",
            style: Theme.of(context).textTheme.bodyText2,
          ),

          const SizedBox(height: 15),

          Text(
            "ดูรายละเอียดคะแนน",
            style: Theme.of(context).textTheme.bodyText2!.apply(
              color: AppColors.blue, 
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      )
    );
  }
  
  // Groub of member slide menu
  Widget getMemberGroupModule(BuildContext context) {
    return SlideMenu(
      label: "หมวดหมู่สมาชิก",
      height: 50,
      hasSeeMore: false,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  width:  50,
                  height:  50,
                ),
                Text(
                  "XXXXXXX",
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          );
        },
      ),
    );
  }
  
  // Benefit slide menu
  Widget getBenefitModule(BuildContext context) {
    return SlideMenu(
      label: "สิทธิประโยชน์แนะนำ",
      height: 120,
      hasSeeMore: false,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.benefitImgs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(right: 20.0),
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image(
              image: AssetImage(
                controller.imagesSrc + controller.benefitImgSrc + controller.benefitImgs[index]
              ),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
  
  // Promotion slide menu
  Widget getPromotionModule(BuildContext context) {
    return SlideMenu(
      label: "โปรโมชั่น",
      height: 150,
      hasSeeMore: false,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 120,
          );
        },
      ),
    );
  }

}