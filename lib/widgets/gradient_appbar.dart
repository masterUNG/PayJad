import 'package:bang_pun_pay/constants/colors.dart';
import 'package:flutter/material.dart';

class GradientAppbar extends StatelessWidget {
  const GradientAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.blue, AppColors.blue, AppColors.lightBlue, AppColors.lightBlue],
          stops: const [0, 0.6, 0.98, 1],
        ),
      ),
    );
  }

}