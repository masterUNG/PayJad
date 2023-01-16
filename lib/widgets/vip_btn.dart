import 'package:bang_pun_pay/widgets/reuse_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class VipButton extends StatelessWidget {
  const VipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/inviteFriends"),
      child: ReUseCard(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColors.blue,
        height: 58,
        child: const Image(
          image: AssetImage("assets/images/button/vip_btn.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}