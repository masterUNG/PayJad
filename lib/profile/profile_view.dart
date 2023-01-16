import 'package:bang_pun_pay/profile/profile_controller.dart';
import 'package:bang_pun_pay/widgets/vip_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widgets/reuse_card.dart';


class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

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
          ReUseCard(
            padding: const EdgeInsets.only(bottom: 20),
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background image
                    Image(
                      image: AssetImage(controller.backgroundSrc + controller.profileBackground),
                    ),

                    // Profile picture
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 3)
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image(
                        image: AssetImage(controller.userImgSrc + controller.userData["image"]!),
                        fit: BoxFit.contain,
                      )
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // User name and verification
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      controller.userData["name"]!,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 160,
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          Text(
                            "ยืนยันตัวแล้ว",
                            style: Theme.of(context).textTheme.bodyText1!.apply(color: Colors.white),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ),

          const VipButton(),

          // Create store button
          getCreateStoreButton(context),
          
          ReUseCard(
            borderRadius: BorderRadius.circular(20),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                getItem(context, Icons.person_outline, "บัญชีและความปลอดภัย"),
                getItem(context, Icons.credit_card_outlined, "ช่องการชำระเงิน"),
                getItem(context, Icons.settings_outlined, "ตั้งค่า"),
                getItem(context, Icons.verified_user_outlined, "ความเป็นส่วนตัว"),
                getItem(context, Icons.help_outline, "ช่วยเหลือ"),
              ],
            ),
          ),
          const SizedBox(height:  80),
        ],
      )
    );
  }
  
  Widget getCreateStoreButton(BuildContext context) {
    return ReUseCard(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(
        vertical:  1.5, 
        horizontal:  2.0
      ),
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        colors: [AppColors.blue, AppColors.lightBlue],
        stops: const [0.2, 1],
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.lightestBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              Icons.storefront_outlined,
              color: AppColors.blue,
            ),
            const SizedBox(width: 10),
            Text(
              "สร้างร้านค้ากับ BangPun Pay",
              style: Theme.of(context).textTheme.headline4!.apply(color: AppColors.blue),
            )
          ],
        ),
      ),
    );
  }

  Widget getItem(BuildContext context, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.headline4,
            )
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.lightGrey,
          ),
        ],
      ),
    );
  }

}