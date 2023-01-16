import 'package:bang_pun_pay/constants/colors.dart';
import 'package:bang_pun_pay/constants/icons.dart';
import 'package:bang_pun_pay/scan/scan_controller.dart';
import 'package:bang_pun_pay/widgets/reuse_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ScanView extends GetView<ScanController> {
  const ScanView({super.key});

  final double qrSize = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.blue,
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "ชำระเงินด้วย QR",
            style: Theme.of(context).textTheme.headline1!.apply(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        color: AppColors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getQrCard(context),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.verified_user_outlined,
                  color: Colors.white,
                ),

                const SizedBox(width: 10),

                Text(
                  "ใช้จ่ายปลอดภัยด้วย BangPunPay",
                  style: Theme.of(context).textTheme.bodyText2!.apply(color: Colors.white),
                  ),
              ],
            ),

            // Scan and Pay button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Scan button
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(AppIcons.src + AppIcons.scan),
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "สแกน",
                        style: Theme.of(context).textTheme.bodyText2!.apply(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 20),

                // Pay button
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      const Icon(
                        Icons.qr_code,
                        color: Colors.white,
                        size: 35,
                      ),
                      Text(
                        "จ่าย",
                        style: Theme.of(context).textTheme.bodyText2!.apply(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Push the widgets up because it will stay at behide bottom navigation.
            const SizedBox(height: 90),
          ],
        ),
      )
    );
  }
  
  // Show QR code
  Widget getQrCard(BuildContext context) {
    return ReUseCard(
      margin: const EdgeInsets.all(0),
      borderRadius: BorderRadius.circular(20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 24,
              bottom: 10,
              left: 24,
              right: 24,
            ),
            child: SizedBox(
              height: 330,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage(controller.qrCodeSrc + controller.barCodeImg),
                  ),
                  SizedBox(
                    width:  qrSize,
                    height:  qrSize,
                    child: Image(
                      image: AssetImage(controller.qrCodeSrc + controller.qrCodeImg),
                    ),
                  ),
            
                  getQrDetail(context),
                ],
              ),
            ),
          ),

          // Divider
          Container(
            height:  1,
            color: AppColors.lightGrey,
          ),

          getPaymentDetail(context),
        ],
      ),
    );
  }
  
  // QR expire time and refresh button
  Widget getQrDetail(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyText2,
            children: [
              const TextSpan(text: "QR Code หมดอายุใน "),
              TextSpan(
                text: controller.timeToExpire,
                style: TextStyle(color: AppColors.blue),
              ),
            ]
          )
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.refresh_outlined,
                color: AppColors.blue,
              ),
              const SizedBox(width: 5.0),
              Text(
                "รีเฟรช",
                style: Theme.of(context).textTheme.bodyText2!.apply(color: AppColors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget getPaymentDetail(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightestBlue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image(
                image: AssetImage(AppIcons.src + AppIcons.wallet),
                height: 24,
                width: 24,
              )
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ช่องทางการชำระเงิน",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text("ยอดเงินในวอเล็ท (฿ ${controller.walletAmount.toStringAsFixed(2)})"),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

}